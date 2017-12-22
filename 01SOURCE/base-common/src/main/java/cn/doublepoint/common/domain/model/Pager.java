/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月22日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.domain.model;

public class Pager {
	private int currentPageNum=0;
	private int pageSize=0;
	private int totalCount=0;
	private int pageCount=0;
	private int pageNumSize=5;
	public int getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageNumSize() {
		return pageNumSize;
	}
	public void setPageNumSize(int pageNumSize) {
		this.pageNumSize = pageNumSize;
	}
	
	
}
