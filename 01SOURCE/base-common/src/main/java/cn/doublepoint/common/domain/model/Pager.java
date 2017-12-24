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
	private int currentPageNum=1;
	private int currentPageCount=0;
	private long totalElementCount=0;
	private int totalPageCount=1;
	private int pageSize=100;
	public int getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public long getTotalElementCount() {
		return totalElementCount;
	}
	public void setTotalElementCount(long totalElementCount) {
		this.totalElementCount = totalElementCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPageCount() {
		return currentPageCount;
	}
	public void setCurrentPageCount(int currentPageCount) {
		this.currentPageCount = currentPageCount;
	}
	
	
}
