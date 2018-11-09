/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月26日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.dto.domain.model.vo.query;

import cn.doublepoint.dto.util.StringUtil;

public class QueryParam {
	public static final String RELATION_EQUAL = "=";
	public static final String RELATION_GT = ">";
	public static final String RELATION_LT = "<";
	public static final String RELATION_GE = ">=";
	public static final String RELATION_LE = "<=";
	public static final String RELATION_NOTEQUAL = "<>";
	public static final String RELATION_LIKE = "LIKE";
	public static final String RELATION_ISNULL = "IS NULL";
	public static final String RELATION_NOTNULL = "IS NOT NULL";
	public static final String RELATION_IN = "IN";
	public static final String RELATION_NOTIN = "NOT IN";
	private String name;
	private Object value;
	private String relation = "=";

	public boolean needValue() {
		if ((this.relation.equals("IS NULL")) || (this.relation.equals("IS NOT NULL"))) {
			return false;
		}
		return true;
	}

	public String getRelation() {
		return this.relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getValue() {
		return this.value;
	}

	public void setValue(Object value) {
		this.value = value;
	}
	
	public QueryParam() {
		super();
	}

	public QueryParam(String name, Object value) {
		super();
		this.name = name;
		this.value = value;
	}

	public QueryParam(String name, Object value, String relation) {
		super();
		this.name = name;
		this.value = value;
		if(StringUtil.isNullOrEmpty(relation))
			this.relation=relation;
	}

	public boolean equals(Object obj) {
		if ((obj == null) || (!(obj instanceof QueryParam))) {
			return false;
		}
		QueryParam p = (QueryParam) obj;
		if (this.name != null) {
			return this.name.equals(p.name);
		}
		return p.name == null;
	}
}
