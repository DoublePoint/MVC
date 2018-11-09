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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import cn.doublepoint.dto.util.StringUtil;

public class QueryParamList {
	private List<QueryParam> params = new ArrayList<QueryParam>();

	public void addParam(String name, Object value) {
		QueryParam param = new QueryParam();
		param.setName(name);
		param.setValue(value);
		this.params.add(param);
	}

	public void addParam(String name, Object value, String relation) {
		QueryParam param = new QueryParam();
		param.setName(name);
		param.setValue(value);
		param.setRelation(relation);
		this.params.add(param);
	}

	public void addParam(QueryParam param) {
		if ((param == null) || (param.getName() == null) || (param.getValue() == null)) {
			return;
		}
		this.params.add(param);
	}

	public void addParamList(QueryParamList aparams) {
		if ((aparams == null) || (aparams.getParams().size() <= 0)) {
			return;
		}
		List<QueryParam> list = aparams.getParams();
		for (int i = 0; i < list.size(); i++) {
			QueryParam param = (QueryParam) list.get(i);
			this.params.add(param);
		}
	}

	public List<QueryParam> getParams() {
		return this.params;
	}

	public void setParams(List<QueryParam> params) {
		this.params = params;
	}

	public int size() {
		return this.params.size();
	}

	public QueryParam get(int index) {
		return (QueryParam) this.params.get(index);
	}

	public QueryParam get(String name) {
		if (StringUtil.isNullOrEmpty(name)) {
			return null;
		}
		for (QueryParam param : this.params) {
			if (name.equals(param.getName())) {
				return param;
			}
		}
		return null;
	}

	public boolean remove(String name) {
		if (null == name) {
			return false;
		}
		for (QueryParam param : this.params) {
			if (name.equals(param.getName())) {
				this.params.remove(param);
				return true;
			}
		}
		return false;
	}

	public ParamAndSql getParamAndSql() {
		ParamAndSql paramAndSql = new ParamAndSql();
		Iterator<QueryParam> it = this.params.iterator();
		StringBuilder sb = new StringBuilder(" WHERE 1=1 ");
		while (it.hasNext()) {
			QueryParam item = (QueryParam) it.next();
			sb.append(" and ").append(item.getName()).append(" ").append(item.getRelation()).append(" ");
			if (item.needValue()) {
				sb.append(" ? ");
				paramAndSql.getParams().add(item.getValue());
			}
		}
		paramAndSql.setSqlString(sb.toString());
		return paramAndSql;
	}
	
	public boolean hasParam(String name){
		return this.get(name)!=null;
	}
}
