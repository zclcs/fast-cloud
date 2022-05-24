package com.zclcs.common.security.starter.configure;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.security.oauth2.resource.*;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.client.OAuth2RestOperations;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.resource.BaseOAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 重写UserInfoTokenServices
 * {@link UserInfoTokenServices#loadAuthentication(String)}
 *
 * @author zclcs
 */
@Slf4j
public class MyUserInfoTokenServices implements ResourceServerTokenServices {

    private final String userInfoEndpointUrl;
    private final String clientId;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private OAuth2RestOperations restTemplate;
    private String tokenType = "Bearer";
    private AuthoritiesExtractor authoritiesExtractor = new FixedAuthoritiesExtractor();
    private PrincipalExtractor principalExtractor = new FixedPrincipalExtractor();

    public MyUserInfoTokenServices(String userInfoEndpointUrl, String clientId) {
        this.userInfoEndpointUrl = userInfoEndpointUrl;
        this.clientId = clientId;
    }

    public void setTokenType(String tokenType) {
        this.tokenType = tokenType;
    }

    public void setRestTemplate(OAuth2RestOperations restTemplate) {
        this.restTemplate = restTemplate;
    }

    public void setAuthoritiesExtractor(AuthoritiesExtractor authoritiesExtractor) {
        Assert.notNull(authoritiesExtractor, "AuthoritiesExtractor must not be null");
        this.authoritiesExtractor = authoritiesExtractor;
    }

    public void setPrincipalExtractor(PrincipalExtractor principalExtractor) {
        Assert.notNull(principalExtractor, "PrincipalExtractor must not be null");
        this.principalExtractor = principalExtractor;
    }

    @Override
    public OAuth2Authentication loadAuthentication(String accessToken) throws AuthenticationException, InvalidTokenException {
        Map<String, Object> map = this.getMap(this.userInfoEndpointUrl, accessToken);
        String error = "error";
        if (map.containsKey(error)) {
            log.debug("userinfo returned error: " + map.get(error));

            throw new InvalidTokenException(accessToken);
        } else {
            return this.extractAuthentication(map);
        }
    }

    @SneakyThrows(value = JsonProcessingException.class)
    private OAuth2Authentication extractAuthentication(Map<String, Object> map) {
        //log.info("信息：{}", JSONUtil.toJsonStr(map));
        Object principal = this.getPrincipal(map);
        List<GrantedAuthority> authorities = this.authoritiesExtractor.extractAuthorities(map);

        String oauth2RequestString = objectMapper.writeValueAsString(map.get("oauth2Request"));

        ObjectNode jsonNodes = objectMapper.readValue(oauth2RequestString, ObjectNode.class);
        TypeReference<Set<String>> setTypeReference = new TypeReference<Set<String>>() {
        };
        Map<String, String> requestParameters = objectMapper.readValue(jsonNodes.get("requestParameters").toString(), new TypeReference<Map<String, String>>() {
        });
        boolean approved = jsonNodes.get("approved").asBoolean();
        Set<String> scope = objectMapper.readValue(jsonNodes.get("scope").toString(), setTypeReference);
        Set<String> resourceIds = objectMapper.readValue(jsonNodes.get("resourceIds").toString(), setTypeReference);
        String redirectUri = jsonNodes.get("redirectUri").toString();
        Set<String> responseTypes = objectMapper.readValue(jsonNodes.get("responseTypes").toString(), setTypeReference);
        Map<String, Serializable> extensions = objectMapper.readValue(jsonNodes.get("extensions").toString(), new TypeReference<Map<String, Serializable>>() {
        });

        OAuth2Request request = new OAuth2Request(requestParameters, this.clientId, authorities, approved, scope, resourceIds, redirectUri, responseTypes, extensions);
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(principal, "N/A", authorities);
        token.setDetails(map);
        return new OAuth2Authentication(request, token);
    }

    protected Object getPrincipal(Map<String, Object> map) {
        Object principal = this.principalExtractor.extractPrincipal(map);
        return principal == null ? "unknown" : principal;
    }

    @Override
    public OAuth2AccessToken readAccessToken(String accessToken) {
        throw new UnsupportedOperationException("Not supported: read access token");
    }

    @SuppressWarnings("all")
    private Map<String, Object> getMap(String path, String accessToken) {
        //log.info("Getting user info from: " + path);

        try {
            OAuth2RestOperations restTemplate = this.restTemplate;
            if (restTemplate == null) {
                BaseOAuth2ProtectedResourceDetails resource = new BaseOAuth2ProtectedResourceDetails();
                resource.setClientId(this.clientId);
                restTemplate = new OAuth2RestTemplate(resource);
            }

            OAuth2AccessToken existingToken = restTemplate.getOAuth2ClientContext().getAccessToken();
            if (existingToken == null || !accessToken.equals(existingToken.getValue())) {
                DefaultOAuth2AccessToken token = new DefaultOAuth2AccessToken(accessToken);
                token.setTokenType(this.tokenType);
                restTemplate.getOAuth2ClientContext().setAccessToken(token);
            }
            Map body = restTemplate.getForEntity(path, Map.class, new Object[0]).getBody();
            return (Map) body;
        } catch (Exception e) {
            log.warn("Could not fetch user details: " + e.getClass() + ", " + e.getMessage());
            return Collections.singletonMap("error", "Could not fetch user details");
        }
    }
}
