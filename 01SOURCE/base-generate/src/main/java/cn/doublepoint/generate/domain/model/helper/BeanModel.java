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

import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.domain.model.StringUtil;

public class BeanModel extends BaseModel{

	private String remark;//实体备注
	private String type;//实体类型
	private String modelExtend;
	private String chName;//实例名称
	private String tableName;//实体表明
	private String className;//类名
	private String idField;//id字段名
	private boolean isDeleteThe_=true;//是否删除下划线
	private boolean isUpcaseTheFirstCharSplit=true;//是否驼峰大写自定字符后的字符串
	private boolean isFilterSomeChar=true;//是否进行某些字符串的过滤
	private List<String> filterStr;//过滤字符串
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
	
	

	public List<String> getFilterStr() {
		return filterStr;
	}

	public void setFilterStr(List<String> filterStr) {
		this.filterStr = filterStr;
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

}
