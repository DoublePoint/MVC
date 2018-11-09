package cn.doublepoint.workflow.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;
import cn.doublepoint.commonutil.port.adapter.persistence.WorkflowModelRequest;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModel;

@Service("llModelService")
public class ModelServiceImpl implements ModelService{

	@Override
	public List<VOActReModel> retrieve(QueryParamList queryParamList) {
		return retrieve(queryParamList,null,null);
	}

	@Override
	public List<VOActReModel> retrieve(QueryParamList queryParamList, SortParamList sortParamList) {
		return retrieve(queryParamList,sortParamList,null);
	}

	@Override
	public List<VOActReModel> retrieve(QueryParamList queryParamList, PageInfo pageInfo) {
		return retrieve(queryParamList,null,pageInfo);
	}

	@Override
	public List<VOActReModel> retrieve(QueryParamList queryParamList, SortParamList sortParamList, PageInfo pageInfo) {
		return JPAUtil.load(VOActReModel.class, queryParamList,pageInfo,sortParamList);
	}

	@Override
	public List<VOActReModel> retrieve(WorkflowModelRequest workflowModelRequest) {
		
		return retrieve(workflowModelRequest.getQueryParams(),workflowModelRequest.getSortParams(),workflowModelRequest.getPageInfo());
	}
    
}
