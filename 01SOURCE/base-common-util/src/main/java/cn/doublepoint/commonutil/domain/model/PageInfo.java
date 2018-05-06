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
	private final int DEFAULT_PAGE_SIZE=20;
	
	private int currentPageNum=1;
	private int currentPageCount=0;
	private long totalElementCount=0;
	private int totalPageCount=1;
	private int pageSize=DEFAULT_PAGE_SIZE;
	private Sort sort;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void getFromJsonObject(JSONObject jsonObject, Class modelClass) {
		Field[] fields = this.getClass().getDeclaredFields();
		Stream.of(fields).forEach(field -> {
			field.setAccessible(true);
			String fieldName = field.getName();
			Class<?> fieldType = field.getType();
			try {
				if(fieldType==int.class){
					field.set(this, jsonObject.getIntValue(fieldName));
					return;
				}
				if(fieldType==long.class){
					field.set(this, jsonObject.getLongValue(fieldName));
					return;
				}
				if(fieldType==Sort.class){
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	
	
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
	public Sort getSort() {
		return sort;
	}
	public void setSort(Sort sort) {
		this.sort = sort;
	}
	public PageInfo() {
		super();
		currentPageNum=1;
		currentPageCount=0;
		totalElementCount=0;
		totalPageCount=1;
		pageSize=DEFAULT_PAGE_SIZE;
	}
	public PageInfo(int currentPageNum, int pageSize) {
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
