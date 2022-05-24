FROM telechow/sentinel-dashboard-persistence-nacos:1.8.4
ENV SENTINEL_PORT=8858
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom -Dserver.port=${SENTINEL_PORT} -Dcsp.sentinel.dashboard.server=127.0.0.1:${SENTINEL_PORT}", "-jar", "sentinel-dashboard.jar"]
CMD ["--auth.username=${ADMIN_USERNAME}", "--auth.password=${ADMIN_PASSWORD}", "--sentinel.dashboard.persistence.nacos.server-addr=${NACOS_ADDR}", "--sentinel.dashboard.persistence.nacos.namespace=${NACOS_NAMESPACE_ID}", "--sentinel.dashboard.persistence.nacos.group-id=${NACOS_GROUP_ID}"]