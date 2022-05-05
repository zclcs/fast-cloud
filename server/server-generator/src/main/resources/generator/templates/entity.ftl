package ${basePackage}.${entityPackage};

<#if hasDate = true>
    import java.util.Date;
</#if>
<#if hasBigDecimal = true>
    import java.math.BigDecimal;
</#if>
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalDate;

/**
 * ${tableComment} Entity
 *
 * @author ${author}
 * @date ${date}
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("${tableName}")
@ApiModel(value = "${className}对象", description = "${tableComment}")
public class ${className} extends BaseEntity {

<#if columns??>
    <#list columns as column>
    /**
     * ${column.remark}
     */
    <#if column.isKey = true>
    @TableId(value = "${column.name}", type = IdType.AUTO)
    <#else>
    @TableField("${column.name}")
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