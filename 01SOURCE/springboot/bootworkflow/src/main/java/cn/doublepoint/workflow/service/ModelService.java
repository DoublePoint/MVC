package cn.doublepoint.workflow.service;

import java.util.List;

import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;
import cn.doublepoint.dto.domain.model.vo.query.WorkflowModelRequest;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModel;

public interface ModelService {
	
	/**
	 * 
	 * @param workflowModelRequest
	 * @return
	 */
	public List<VOActReModel> retrieve(WorkflowModelRequest workflowModelRequest);

	/**
	 * 
	 * @param queryParamList
	 * @return
	 */
	public List<VOActReModel> retrieve(QueryParamList queryParamList);

	/**
	 * 
	 * @param queryParamList
	 * @param sortParamList
	 * @return
	 */
	public List<VOActReModel> retrieve(QueryParamList queryParamList, SortParamList sortParamList);

	/**
	 * 
	 * @param queryParamList
	 * @param pageInfo
	 * @return
	 */
	public List<VOActReModel> retrieve(QueryParamList queryParamList, PageInfo pageInfo);

	/**
	 * 
	 * @param queryParamList
	 * @param sortParamList
	 * @param pageInfo
	 * @return
	 */
	public List<VOActReModel> retrieve(QueryParamList queryParamList, SortParamList sortParamList, PageInfo pageInfo);

}
