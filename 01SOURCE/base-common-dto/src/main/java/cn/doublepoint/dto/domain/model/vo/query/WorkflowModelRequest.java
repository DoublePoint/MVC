/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月30日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.dto.domain.model.vo.query;

public class WorkflowModelRequest {
	
	private QueryParamList queryParams=new QueryParamList();
	private SortParamList sortParams=new SortParamList();
	private PageInfo pageInfo=new PageInfo();
	
	public boolean isContainQueryParam(String paramName){
		return this.queryParams.hasParam(paramName);
	}
	public boolean isSortQueryParam(String paramName){
		return this.sortParams.hasParam(paramName);
	}

	public QueryParam getQueryParam(String paramName){
		return this.queryParams.get(paramName);
	}
	
	public SortParam getSortParam(String paramName){
		return this.sortParams.get(paramName);
	}
	

	public QueryParamList getQueryParams() {
		return queryParams;
	}
	public void setQueryParams(QueryParamList queryParams) {
		this.queryParams = queryParams;
	}
	public SortParamList getSortParams() {
		return sortParams;
	}
	public void setSortParams(SortParamList sortParams) {
		this.sortParams = sortParams;
	}
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

}
