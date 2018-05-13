/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月22日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.domain.model;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.data.domain.Sort;

import com.alibaba.fastjson.JSONObject;

public class PageInfo {
	private final long DEFAULT_PAGE_SIZE=20;
	
	private long currentPageNum=1;
	private long currentPageCount=0;
	private long totalElementCount=0;
	private long totalPageCount=1;
	private long pageSize=DEFAULT_PAGE_SIZE;
	
	public long getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(long currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public long getTotalElementCount() {
		return totalElementCount;
	}
	public void setTotalElementCount(long totalElementCount) {
		this.totalElementCount = totalElementCount;
		this.totalPageCount=(long)Math.ceil(totalElementCount/pageSize);
	}
	public long getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(long totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public long getPageSize() {
		return pageSize;
	}
	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
		this.totalPageCount=(long)Math.ceil(totalElementCount/pageSize);
	}
	public long getCurrentPageCount() {
		return currentPageCount;
	}
	public void setCurrentPageCount(long currentPageCount) {
		this.currentPageCount = currentPageCount;
	}
	public PageInfo() {
		super();
		currentPageNum=1;
		currentPageCount=0;
		totalElementCount=0;
		totalPageCount=1;
		pageSize=DEFAULT_PAGE_SIZE;
	}
	public PageInfo(long currentPageNum, long pageSize) {
		super();
		this.currentPageNum = currentPageNum;
		this.pageSize = pageSize;
	}
	
	//获取其实位置
	public long getStart(){
		return (this.currentPageNum-1)*this.pageSize;
	}
	//获取结束位置
	public long getEnd(){
		return this.currentPageCount*this.pageSize;
	}
	
	public String getLimitSql(){
		return " limit "+this.currentPageNum*pageSize+","+pageSize+"";
	}
	
	
}
