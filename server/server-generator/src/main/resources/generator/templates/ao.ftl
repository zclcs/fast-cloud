package ${basePackage}.${entityPackage};

<#if hasDate = true>
    import java.util.Date;
</#if>
<#if hasBigDecimal = true>
    import java.math.BigDecimal;
</#if>
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * ${tableComment} Ao
 *
 * @author ${author}
 * @date ${date}
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "${className}Ao对象", description = "${tableComment}")
public class ${className}Ao implements Serializable {

    private static final long serialVersionUID = 1L;

<#if columns??>
    <#list columns as column>
    <#if (column.type = 'varchar' || column.type = 'text' || column.type = 'uniqueidentifier'
    || column.type = 'varchar2' || column.type = 'nvarchar' || column.type = 'VARCHAR2'
    || column.type = 'VARCHAR'|| column.type = 'CLOB' || column.type = 'char') && column.isCharMaxLength = true>
    @Size(max = ${column.charMaxLength}, message = "{noMoreThan}")
    </#if>
    <#if column.isKey = true>
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "${column.remark}")
    </#if>
    <#if (column.type = 'varchar' || column.type = 'text' || column.type = 'uniqueidentifier'
    || column.type = 'varchar2' || column.type = 'nvarchar' || column.type = 'VARCHAR2'
    || column.type = 'VARCHAR'|| column.type = 'CLOB' || column.type = 'char')>
        <#if column.isNullable = false && column.isKey = false>
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "${column.remark}", required = true)
        </#if>
    <#else>
        <#if column.isNullable = false && column.isKey = false>
    @NotNull(message = "{required}")
    @ApiModelProperty(value = "${column.remark}", required = true)
        </#if>
    </#if>
    <#if column.isNullable = true && column.isKey = false>
    @ApiModelProperty(value = "${column.remark}")
    </#if>
    <#if (column.type = 'varchar' || column.type = 'text' || column.type = 'uniqueidentifier'
    || column.type = 'varchar2' || column.type = 'nvarchar' || column.type = 'VARCHAR2'
    || column.type = 'VARCHAR'|| column.type = 'CLOB' || column.type = 'char')>
    private String ${column.field?uncap_first};
    </#if>
    <#if column.type = 'timestamp' || column.type = 'date' || column.type = 'datetime'||column.type = 'TIMESTAMP' || column.type = 'DATE' || column.type = 'DATETIME'>
    private Date ${column.field?uncap_first};
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