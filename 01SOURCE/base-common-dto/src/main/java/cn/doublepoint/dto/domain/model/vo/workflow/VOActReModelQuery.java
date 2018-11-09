package cn.doublepoint.dto.domain.model.vo.workflow;

import cn.doublepoint.dto.domain.model.vo.query.EnumSortParamType;
import cn.doublepoint.dto.domain.model.vo.query.WorkflowModelRequest;

/**
 * The persistent class for the act_re_model database table.
 * 
 */
public class VOActReModelQuery {
	
	private WorkflowModelRequest request=new WorkflowModelRequest();

	/**
	 * 添加查询变量
	 * @param name
	 * @param value
	 */
	public void addQueryParam(EnumActReModelQuery name, Object value){
		request.getQueryParams().addParam(name.toString(), value);
	}

	/**
	 * 添加查询变量
	 * @param name
	 * @param value
	 */
	public void addQueryParam(EnumActReModelQuery name, Object value, String relation){
		request.getQueryParams().addParam(name.toString(), value, relation);
	}
	

	/**
	 * 添加排序信息
	 * @param name
	 */
	public void addSortParam(EnumActReModelQuery name){
		request.getSortParams().addParam(name.toString());
	}
	

	/**
	 * 添加排序信息
	 * @param name
	 */
	public void addSortParam(EnumActReModelQuery name, EnumSortParamType sortParamType){
		request.getSortParams().addParam(name.toString(), sortParamType);
	}

	public WorkflowModelRequest getRequest() {
		return request;
	}

	public void setRequest(WorkflowModelRequest request) {
		this.request = request;
	}
	
	
}