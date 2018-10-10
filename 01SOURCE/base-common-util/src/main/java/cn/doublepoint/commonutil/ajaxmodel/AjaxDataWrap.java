/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.ajaxmodel;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.template.dto.domain.model.entity.BaseModel;

public class AjaxDataWrap<T> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private List<T> dataList=new ArrayList<T>();
	private T data;
	private PageInfo pageInfo;

	public <R extends BaseModel> AjaxDataWrap<R> copy(Class<R> targetClass) {
		AjaxDataWrap<R> ajaxDataWrap = new AjaxDataWrap<>();
		ajaxDataWrap.setPageInfo(this.pageInfo);
		ajaxDataWrap.setDataList(CommonBeanUtils.copyTo(this.dataList, targetClass));
		return ajaxDataWrap;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
		
		/*if (dataList != null) {
			for (int i = 0; i < dataList.size(); i++) {
				dataList.get(i).setRowId(i);
			}
		}*/
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public AjaxDataWrap() {
		super();
		this.pageInfo = new PageInfo();
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
}
