/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017-9-29 下午10:21:35
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate.domain.model.helper;

import java.util.List;

import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.generate.EGenerateType;
import cn.doublepoint.generate.GenerateTemplateUtil;
import cn.doublepoint.template.dto.domain.model.entity.BaseModel;

public class TemplateEntityModel extends BaseModel {

	private String remark;// 实体备注
	private String type;// 实体类型
	private String modelExtend;
	private String chName;// 实例中文名称
	private String tableName;// 表名称
	private String annotationTableName;// 实体中 注解Entity中显示的表名称 默认全部大写
	private String entityClassName;// 类名
	private String idField;// id字段名
	private boolean isUpcaseTheFirstCharSplit = true;// 是否驼峰大写自定字符后的字符串
	private List<TemplateEntityField> fields;

	public TemplateEntityModel() {
	}

	public TemplateEntityModel(String tableName) {
		super();
		this.tableName = tableName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getModelExtend() {
		return modelExtend;
	}

	public void setModelExtend(String modelExtend) {
		this.modelExtend = modelExtend;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
		this.annotationTableName = StringUtil.upcase(tableName);
		this.entityClassName = GenerateTemplateUtil.getClassName(tableName, EGenerateType.Entity);
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public List<TemplateEntityField> getFields() {
		return fields;
	}

	public void setFields(List<TemplateEntityField> fields) {
		this.fields = fields;
	}

	public String getEntityClassName() {
		return entityClassName;
	}

	public void setEntityClassName(String entityClassName) {
		this.entityClassName = entityClassName;
	}

	public boolean isUpcaseTheFirstCharSplit() {
		return isUpcaseTheFirstCharSplit;
	}

	public void setUpcaseTheFirstCharSplit(boolean isUpcaseTheFirstCharSplit) {
		this.isUpcaseTheFirstCharSplit = isUpcaseTheFirstCharSplit;
	}

	public String getAnnotationTableName() {
		return annotationTableName;
	}

	public void setAnnotationTableName(String annotationTableName) {
		this.annotationTableName = annotationTableName;
	}

}
