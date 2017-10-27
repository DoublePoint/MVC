/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017-9-29 下午10:21:35
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.billing;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ModelModel {

	private String modelComment;
	private String modelType;
	private String modelExtend;
	private String modelName;
	private String modelCode;

	public String getModelComment() {
		return modelComment;
	}

	public void setModelComment(String modelComment) {
		this.modelComment = modelComment;
	}

	public String getModelType() {
		return modelType;
	}

	public void setModelType(String modelType) {
		this.modelType = modelType;
	}

	public String getModelExtend() {
		return modelExtend;
	}

	public void setModelExtend(String modelExtend) {
		this.modelExtend = modelExtend;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getModelCode() {
		return modelCode;
	}

	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}

	public List<ModelField> getFields() {
		return fields;
	}

	public void setFields(List<ModelField> fields) {
		this.fields = fields;
	}

	private List<ModelField> fields;

	public String getCotent() {
		if (modelName == null || "".equals(modelName))
			return "";
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");

		StringBuffer sbBuffer = new StringBuffer();
		sbBuffer.append("/** \r\n");
		sbBuffer.append("* 创   建   人： 刘磊 \r\n");

		sbBuffer.append("* \r\n");
		sbBuffer.append("* 创   建   时   间 ：" + formatter.format(date) + "\r\n");

		sbBuffer.append("* \r\n");
		// sbBuffer.append("* 类 说 明 ：
		// "+modelName+"："+modelComment==null?"":modelComment+" \r\n");
		sbBuffer.append("* 类   说   明 ：     " + modelName + "\r\n");
		sbBuffer.append("* \r\n");
		sbBuffer.append("* 修   改   人：          修   改   日   期： \r\n");
		sbBuffer.append("*/\r\n");
		// sbBuffer.append("package cn.doublepoint.domain.model.entity.xt;
		// \r\n");
		sbBuffer.append("package com.haiyisoft.billing.domain.model.entity.corePrice;\r\n");
		sbBuffer.append("\r\n");
		sbBuffer.append("\r\n");

		switch (modelType) {
		case CONSTANT.CLASS_TYPE_ENTITY:
			sbBuffer.append(buildEntityClassBody());
			break;
		case CONSTANT.CLASS_TYPE_ENUM:
			sbBuffer.append(buildEnumClassBody());
			break;
		case CONSTANT.CLASS_TYPE_VALUEOBJECT:
			sbBuffer.append(buildValueObjectClassBody());
			break;
		default:
			break;
		}

		// ======================================
		sbBuffer.append("}\r\n");

		return sbBuffer.toString();
	}

	private StringBuffer buildEntityClassBody() {
		StringBuffer sbBuffer = new StringBuffer();
		sbBuffer.append("import javax.persistence.Column;\r\n");
		sbBuffer.append("import javax.persistence.Entity;\r\n");
		sbBuffer.append("import javax.persistence.Id;\r\n");
		sbBuffer.append("import javax.persistence.Table;\r\n");
		sbBuffer.append("import java.math.BigDecimal;\r\n");
		sbBuffer.append("import java.sql.Timestamp;\r\n");
		sbBuffer.append("import com.haiyisoft.common.domain.model.ConcurrencySafeEntity;\r\n");
		sbBuffer.append("@Entity \r\n");
		sbBuffer.append("@Table(name=\"" + modelCode.substring(0, 1).toLowerCase()+modelCode.substring(1).replaceAll("[A-Z]", "_$0").toLowerCase()
				+ "\") \r\n");
		sbBuffer.append("public class " + modelCode
				+ "  extends ConcurrencySafeEntity{\r\n");
		sbBuffer.append("	/**\r\n");
		sbBuffer.append("	 *\r\n");
		sbBuffer.append("	 */\r\n");
		sbBuffer.append(
				"     private static final long serialVersionUID = 1L; \r\n");
		sbBuffer.append("\r\n");
		sbBuffer.append("\r\n");
		// ===================================
		for (int i = 0; i < fields.size(); i++) {
			if (i == 0) {
				sbBuffer.append("	@Id\r\n");
			}
			sbBuffer.append(fields.get(i).getFieldContent());
		}
		for (int i = 0; i < fields.size(); i++) {
			sbBuffer.append(fields.get(i).getGetFunctionContent());
		}
		for (int i = 0; i < fields.size(); i++) {
			sbBuffer.append(fields.get(i).getSetFunctionContent());
		}
		sbBuffer.append("	protected " + modelCode+ "(){\r\n");
		sbBuffer.append("		super();\r\n");
		sbBuffer.append("	}\r\n");

		sbBuffer.append("	protected " + modelCode + "(");
		
		for (int i = 0; i < fields.size(); i++) {
			if (i == fields.size() - 1) {
				sbBuffer.append("			" + fields.get(i).getFieldType() + " " + fields.get(i).getFieldName() + "\r\n");
			} else {
				sbBuffer.append("			" + fields.get(i).getFieldType() + " " + fields.get(i).getFieldName() + ",\r\n");
			}
		}
		sbBuffer.append(")");
		sbBuffer.append("{\r\n");
		for (int i = 0; i < fields.size(); i++) {
			sbBuffer.append(
					"		this." + fields.get(i).getFieldName() + " = " + fields.get(i).getFieldName() + ";\r\n");
		}
		sbBuffer.append("	}\r\n");
		return sbBuffer;
	}

	private StringBuffer buildEnumClassBody() {
		StringBuffer sbBuffer = new StringBuffer();
		sbBuffer.append("import java.util.HashMap;\r\n");
		sbBuffer.append("import java.util.Map;\r\n");

		sbBuffer.append("public enum " + modelCode + " {\r\n");
		sbBuffer.append("\r\n");
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
		sbBuffer.append("	private " + modelCode + "(String aCode){\r\n");
		sbBuffer.append("		this.code = aCode;\r\n");
		sbBuffer.append("	}\r\n");
		sbBuffer.append("	private static final Map<String, " + modelCode + "> stringToEnum = new HashMap<String, "
				+ modelCode + ">();\r\n");
		sbBuffer.append("	static {");
		sbBuffer.append("	    for(" + modelCode + " t : values()) {\r\n");
		sbBuffer.append("	        stringToEnum.put(t.toString(), t);\r\n");
		sbBuffer.append("	    }\r\n");
		sbBuffer.append("	 }\r\n");
		sbBuffer.append("	public static " + modelCode + " fromString(String symbol) {\r\n");
		sbBuffer.append("	    return stringToEnum.get(symbol);\r\n");
		sbBuffer.append("	}\r\n");

		sbBuffer.append("	public String toString(){\r\n");
		sbBuffer.append("	return this.code;\r\n");
		sbBuffer.append("	}");
		return sbBuffer;
	}

	private StringBuffer buildValueObjectClassBody() {
		StringBuffer sbBuffer = new StringBuffer();
		sbBuffer.append("import javax.persistence.Embeddable;\r\n");
		sbBuffer.append("import javax.persistence.EnumType;\r\n");
		sbBuffer.append("import javax.persistence.Enumerated;\r\n");
		sbBuffer.append("import javax.persistence.Temporal;\r\n");
		sbBuffer.append("import javax.persistence.TemporalType;\r\n");
		sbBuffer.append("import com.haiyisoft.billing.common.CalcType;\r\n");
		sbBuffer.append(
				"import com.haiyisoft.common.domain.model.IdentifiedValueObject;\r\n");

		sbBuffer.append("@Embeddable \r\n");
		sbBuffer.append("public class " + modelCode
				+ " extends IdentifiedValueObject {\r\n");
		sbBuffer.append("\r\n");
		// ===================================
		for (int i = 0; i < fields.size(); i++) {
			if (i == 0) {
				sbBuffer.append("	@Id\r\n");
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
	// StringBuffer sbBuffer = new StringBuffer();
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
	// com.haiyisoft.billing.domain.model.entity.corePrice; \r\n");
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
