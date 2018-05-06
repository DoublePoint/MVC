/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.domain.model;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.BeanUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.BeanUtil;

public class AjaxDataWrap<T extends BaseModel> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private List<T> dataList;
	private PageInfo pageInfo;

	public <R extends BaseModel> AjaxDataWrap<R> copy(Class<R> targetClass) {
		AjaxDataWrap<R> ajaxDataWrap = new AjaxDataWrap<>();
		ajaxDataWrap.setPageInfo(this.pageInfo);
		ajaxDataWrap.setDataList(CommonBeanUtils.copyTo(this.dataList, targetClass));
		return ajaxDataWrap;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void getFromJsonObject(JSONObject jsonObject, Class modelClass) {
		Field[] fields = this.getClass().getDeclaredFields();
		dataList = new ArrayList<>();
		Stream.of(fields).forEach(field -> {
			field.setAccessible(true);
			String fieldName = field.getName();
			Class<?> fieldType = field.getType();
			try {
				if(fieldType==List.class){
					initDataList(jsonObject,modelClass,field);
				}
				else if(fieldType==PageInfo.class){
//					initPageInfo(jsonObject);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	/**
	 * 初始化dataList
	 * @param jsonObject
	 * @param modelClass
	 * @param field
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private void initDataList(JSONObject jsonObject, Class modelClass,Field field) throws Exception{
		String fieldName=field.getName();
		JSONArray jsonArray = jsonObject.getJSONArray(fieldName);
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject modelObject = jsonArray.getJSONObject(i);

			T t = (T) modelClass.newInstance();
			Method method1 = modelClass.getMethod("getFromJsonObject", JSONObject.class);
			method1.invoke(t, modelObject);
			dataList.add(t);
		}

		field.set(this, dataList);
	}
	
	/**
	 * 初始化分页信息
	 * @param jsonObject
	 * @param modelClass
	 * @param field
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private void initPageInfo(JSONObject jsonObject,Field field) throws Exception{
		String fieldName=field.getName();
		JSONObject pageInfoObj = jsonObject.getJSONObject(fieldName);

		PageInfo pageInfo=new PageInfo();
		Method getFromJsonObject = JSONObject.class.getMethod("getFromJsonObject", JSONObject.class);
		getFromJsonObject.invoke(pageInfo, pageInfoObj);
		field.set(this, pageInfo);
	
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;

		if (dataList != null) {
			for (int i = 0; i < dataList.size(); i++) {
				dataList.get(i).setRowId(i);
			}
		}
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
}
