/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017-9-29 下午10:21:35
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package TestXMLReader;

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

	
	public String getCotent(){
		if(modelName==null||"".equals(modelName))
			return "";
		Date date=new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		
		StringBuffer sbBuffer = new StringBuffer();
		sbBuffer.append("/**                                                               \r\n");
		sbBuffer.append("* 创   建   人： 刘磊                                             \r\n");
		
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 创   建   时   间 ："+formatter.format(date)+"                      \r\n");
		
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 类   说   明 ：     "+modelComment+"    \r\n");
		sbBuffer.append("*                                                                 \r\n");
		sbBuffer.append("* 修   改   人：          修   改   日   期：                     \r\n");
		sbBuffer.append("*/                                                                \r\n");
		sbBuffer.append("package cn.doublepoint.domain.model.entity.xt;                    \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("import javax.persistence.Column;                                  \r\n");
		sbBuffer.append("import javax.persistence.Entity;                                  \r\n");
		sbBuffer.append("import javax.persistence.Id;                                      \r\n");
		sbBuffer.append("                                                                  \r\n");
		sbBuffer.append("@Entity                                                           \r\n");
		sbBuffer.append("public class "+modelName+" {                                              \r\n");
		sbBuffer.append("                                                                  \r\n");
		//===================================
		for (int i=0;i<fields.size();i++) {
			if(i==0){
				sbBuffer.append("	@Id                                                              \r\n");
			}
			sbBuffer.append(fields.get(i).getCotent());			
		}
		
		//======================================
		sbBuffer.append("}\r\n");
		
		return sbBuffer.toString();
	}
}
