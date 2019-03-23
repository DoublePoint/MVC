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

import cn.doublepoint.commonutil.domain.model.CommonBeanUtil;
import cn.doublepoint.dto.domain.model.entity.BaseModel;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

public class AjaxDataPacket<T> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private List<T> dataList=new ArrayList<T>();
	private T data;
	private PageInfo pageInfo;

	public <R extends BaseModel> AjaxDataPacket<R> copy(Class<R> targetClass) {
		AjaxDataPacket<R> ajaxDataPacket = new AjaxDataPacket<>();
		ajaxDataPacket.setPageInfo(this.pageInfo);
		ajaxDataPacket.setDataList(CommonBeanUtil.copyTo(this.dataList, targetClass));
		return ajaxDataPacket;
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

	public AjaxDataPacket() {
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
