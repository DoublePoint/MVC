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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.generate.domain.model.billing.CONSTANT;

public class JavaBeanModel {

	private String remark;//实体备注
	private String type;//实体类型
	private String modelExtend;
	private String chName;//实例名称
	private String tableName;//实体表明
	private String className;
	private String idField;//id字段名
	private boolean isDeleteThe_=true;//是否删除下划线
	private boolean isUpcaseTheFirstCharSplit=true;//是否驼峰大写自定字符后的字符串
	private boolean isFilterSomeChar=true;//是否进行某些字符串的过滤
	private List<ModelField> fields;
	
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
		
		if(isUpcaseTheFirstCharSplit&&isDeleteThe_){
			className=StringUtil.upcaseAfter(this.tableName,"_");
		}
		if(isFilterSomeChar){
			className=className.replaceFirst("Sys", "");
		}
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}
	
	public List<ModelField> getFields() {
		return fields;
	}

	public void setFields(List<ModelField> fields) {
		this.fields = fields;
	}
	
	

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public boolean isDeleteThe_() {
		return isDeleteThe_;
	}

	public void setDeleteThe_(boolean isDeleteThe_) {
		this.isDeleteThe_ = isDeleteThe_;
	}

	public boolean isUpcaseTheFirstCharSplit() {
		return isUpcaseTheFirstCharSplit;
	}

	public void setUpcaseTheFirstCharSplit(boolean isUpcaseTheFirstCharSplit) {
		this.isUpcaseTheFirstCharSplit = isUpcaseTheFirstCharSplit;
	}

	public boolean isFilterSomeChar() {
		return isFilterSomeChar;
	}

	public void setFilterSomeChar(boolean isFilterSomeChar) {
		this.isFilterSomeChar = isFilterSomeChar;
	}

	public String getCotent() {
		if (chName == null || "".equals(chName))
			return "";
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");

		StringBuilder sbBuffer = new StringBuilder();
		sbBuffer.append("/**                                                               \r\n");
		sbBuffer.append("* 创   建   人： 刘磊                                             \r\n");

		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 创   建   时   间 ：" + formatter.format(date) + "                      \r\n");

		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 类   说   明 ：     " + chName + "    \r\n");
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 修   改   人：          修   改   日   期：                     \r\n");
		sbBuffer.append("*/                                                                \r\n");
		// sbBuffer.append("package cn.doublepoint.domain.model.entity.xt;
		// \r\n");
		

		switch (type) {
		case CONSTANT.CLASS_TYPE_ENTITY:
			sbBuffer.append("package cn.doublepoint.common.domain.model.entity.xt;   \r\n");
			sbBuffer.append("                                                                  \r\n");
			sbBuffer.append("                                                                  \r\n");
			sbBuffer.append(buildEntityClassBody());
			break;
		case CONSTANT.CLASS_TYPE_ENUM:
			sbBuffer.append("\r\n");
			sbBuffer.append("                                                                  \r\n");
			sbBuffer.append("                                                                  \r\n");
			sbBuffer.append(buildEnumClassBody());
			break;
		case CONSTANT.CLASS_TYPE_VALUEOBJECT:
			sbBuffer.append("package cn.doublepoint.common.domain.model.valueobject.xt;   \r\n");
			sbBuffer.append("                                                                  \r\n");
			sbBuffer.append("                                                                  \r\n");
			sbBuffer.append(buildValueObjectClassBody());
			break;
		default:
			break;
		}

		// ======================================
		sbBuffer.append("}\r\n");

		return sbBuffer.toString();
	}

	private StringBuilder buildEntityClassBody() {
		StringBuilder sbBuffer = new StringBuilder();
		sbBuffer.append("import javax.persistence.Column;                                  \r\n");
		sbBuffer.append("import javax.persistence.Entity;                                  \r\n");
		sbBuffer.append("import javax.persistence.Id;                                      \r\n");
		sbBuffer.append("import javax.persistence.Table;                                      \r\n");
		sbBuffer.append("import java.math.BigDecimal;\r\n");
		sbBuffer.append("import java.sql.Timestamp;\r\n");
		sbBuffer.append("    \r\n");
		sbBuffer.append("@Entity                                                           \r\n");
		sbBuffer.append("@Table(name=\"" + tableName + "\")                                                   \r\n");
		sbBuffer.append("public class " + "T_"+tableName
				+ "  extends BaseEntity{                                              \r\n");
		sbBuffer.append("	/**                                                                  \r\n");
		sbBuffer.append("	 *                                                                    \r\n");
		sbBuffer.append("	 */                                                                  \r\n");
		sbBuffer.append(
				"     private static final long serialVersionUID = 1L;                                                             \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("                                                                  \r\n");
		// ===================================
		for (int i = 0; i < fields.size(); i++) {
			if (i == 0) {
				sbBuffer.append("	@Id                                                              \r\n");
			}
			sbBuffer.append(fields.get(i).getFieldContent());
		}
		for (int i = 0; i < fields.size(); i++) {
			sbBuffer.append(fields.get(i).getSetFunctionContent());
		}
		for (int i = 0; i < fields.size(); i++) {
			sbBuffer.append(fields.get(i).getGetFunctionContent());
		}
		return sbBuffer;
	}

	private StringBuilder buildEnumClassBody() {
		StringBuilder sbBuffer = new StringBuilder();
		sbBuffer.append("import java.util.HashMap;                                  \r\n");
		sbBuffer.append("import java.util.Map;                                  \r\n");

		sbBuffer.append("public enum " + tableName + " {                                              \r\n");
		sbBuffer.append("                                                                  \r\n");
		// ===================================
		for (int i = 0; i < fields.size(); i++) {
			boolean isLast = false;
			if (i == fields.size() - 1)
				isLast = true;
			sbBuffer.append(fields.get(i).getEnumFieldContent(i + 1, isLast));
		}
		if (fields.size() <= 0)
			return sbBuffer;
		sbBuffer.append("	private String code;\r\n");
		sbBuffer.append("	private " + tableName + "(String aCode){\r\n");
		sbBuffer.append("		this.code = aCode;\r\n");
		sbBuffer.append("	}\r\n");
		sbBuffer.append("	private static final Map<String, " + tableName + "> stringToEnum = new HashMap<String, "
				+ tableName + ">();\r\n");
		sbBuffer.append("	static {");
		sbBuffer.append("	    for(" + tableName + " t : values()) {\r\n");
		sbBuffer.append("	        stringToEnum.put(t.toString(), t);\r\n");
		sbBuffer.append("	    }\r\n");
		sbBuffer.append("	 }\r\n");
		sbBuffer.append("	public static " + tableName + " fromString(String symbol) {\r\n");
		sbBuffer.append("	    return stringToEnum.get(symbol);\r\n");
		sbBuffer.append("	}\r\n");

		sbBuffer.append("	public String toString(){\r\n");
		sbBuffer.append("	return this.code;\r\n");
		sbBuffer.append("	}");
		return sbBuffer;
	}

	private StringBuilder buildValueObjectClassBody() {
		StringBuilder sbBuffer = new StringBuilder();
		sbBuffer.append("import javax.persistence.Embeddable;                                  \r\n");
		sbBuffer.append("import javax.persistence.EnumType;                                  \r\n");
		sbBuffer.append("import javax.persistence.Enumerated;                                      \r\n");
		sbBuffer.append("import javax.persistence.Temporal;                                      \r\n");
		sbBuffer.append("import javax.persistence.TemporalType;                                      \r\n");

		sbBuffer.append("@Embeddable                                                           \r\n");
		sbBuffer.append("public class " + tableName
				+ " extends BaseValueObject {                                              \r\n");
		sbBuffer.append("                                                                  \r\n");
		// ===================================
		for (int i = 0; i < fields.size(); i++) {
			if (i == 0) {
				sbBuffer.append("	@Id                                                              \r\n");
			}
			sbBuffer.append(fields.get(i).getEntityFieldContent());
		}
		return sbBuffer;
	}

	// public String getCotent() {
	// if (modelName == null || "".equals(modelName))
	// return "";
	// Date date = new Date();
	// SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
	//
	// StringBuilder sbBuffer = new StringBuilder();
	// sbBuffer.append("/** \r\n");
	// sbBuffer.append("* 创 建 人： 刘磊 \r\n");
	//
	// sbBuffer.append("* \r\n");
	// sbBuffer.append("* 创 建 时 间 ：" + formatter.format(date) + " \r\n");
	//
	// sbBuffer.append("* \r\n");
	// // sbBuffer.append("* 类 说 明 ：
	// // "+modelName+"："+modelComment==null?"":modelComment+" \r\n");
	// sbBuffer.append("* 类 说 明 ： " + modelName + " \r\n");
	// sbBuffer.append("* \r\n");
	// sbBuffer.append("* 修 改 人： 修 改 日 期： \r\n");
	// sbBuffer.append("*/ \r\n");
	//// sbBuffer.append("package cn.doublepoint.domain.model.entity.xt; \r\n");
	// sbBuffer.append("package
	// sbBuffer.append(" \r\n");
	// sbBuffer.append(" \r\n");
	//
	// switch (modelType) {
	// case CONSTANT.CLASS_TYPE_ENTITY:
	// sbBuffer.append(buildEntityClassBody());
	// break;
	// case CONSTANT.CLASS_TYPE_ENUM:
	// sbBuffer.append(buildEnumClassBody());
	// break;
	// case CONSTANT.CLASS_TYPE_VALUEOBJECT:
	// sbBuffer.append(buildValueObjectClassBody());
	// break;
	// default:
	// break;
	// }
	//
	// // ======================================
	// sbBuffer.append("}\r\n");
	//
	// return sbBuffer.toString();
	// }
}
