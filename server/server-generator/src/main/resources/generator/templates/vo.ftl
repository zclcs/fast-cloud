package ${basePackage}.${entityPackage};

<#if hasDate = true>
    import java.util.Date;
</#if>
<#if hasBigDecimal = true>
    import java.math.BigDecimal;
</#if>
import com.houkunlin.system.dict.starter.json.Array;
import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * ${tableComment} Vo
 *
 * @author ${author}
 * @date ${date}
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "${className}Vo对象", description = "${tableComment}")
public class ${className}Vo implements Serializable {

    private static final long serialVersionUID = 1L;

<#if columns??>
    <#list columns as column>
    @ApiModelProperty(value = "${column.remark}")
    <#if column.hasDict = true && column.isArray = true>
    @DictText(value = "${column.remarkDict}", array = @Array)
    </#if>
    <#if column.hasDict = true && column.isArray = false>
    @DictText("${column.remarkDict}")
    </#if>
    <#if (column.type = 'varchar' || column.type = 'text' || column.type = 'uniqueidentifier'
    || column.type = 'varchar2' || column.type = 'nvarchar' || column.type = 'VARCHAR2'
    || column.type = 'VARCHAR'|| column.type = 'CLOB' || column.type = 'char' || column.type = 'json')>
    private String ${column.field?uncap_first};
    </#if>
    <#if column.type = 'timestamp' || column.type = 'TIMESTAMP'>
    private Long ${column.field?uncap_first};
    </#if>
    <#if column.type = 'date' || column.type = 'DATE'>
    private LocalDate ${column.field?uncap_first};
    </#if>
    <#if column.type = 'datetime' || column.type = 'DATETIME'>
    private LocalDateTime ${column.field?uncap_first};
    </#if>
    <#if column.type = 'int' || column.type = 'smallint'>
    private Integer ${column.field?uncap_first};
    </#if>
    <#if column.type = 'double'>
    private Double ${column.field?uncap_first};
    </#if>
    <#if column.type = 'bigint'>
    private Long ${column.field?uncap_first};
    </#if>
    <#if column.type = 'tinyint'>
    private Byte ${column.field?uncap_first};
    </#if>
    <#if column.type = 'decimal' || column.type = 'numeric'>
    private BigDecimal ${column.field?uncap_first};
    </#if>

    </#list>
</#if>

}