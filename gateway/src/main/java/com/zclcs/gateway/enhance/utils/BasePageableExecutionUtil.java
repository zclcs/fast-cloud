package com.zclcs.gateway.enhance.utils;

import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.ReactiveMongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import reactor.core.publisher.Flux;

/**
 * @author MrBird
 */
public abstract class BasePageableExecutionUtil {

    public static <FEBS> Flux<FEBS> getPages(Query query, BasePageAo request, Class<FEBS> clazz,
                                             ReactiveMongoTemplate template) {
        Sort sort = Sort.by("id").descending();
        if (StringUtils.isNotBlank(request.getField()) && StringUtils.isNotBlank(request.getOrder())) {
            sort = MyConstant.ORDER_ASC.equals(request.getOrder()) ?
                    Sort.by(request.getField()).ascending() :
                    Sort.by(request.getField()).descending();
        }
        Pageable pageable = PageRequest.of(request.getPageNum(), request.getPageSize(), sort);
        return template.find(query.with(pageable), clazz);
    }
}
