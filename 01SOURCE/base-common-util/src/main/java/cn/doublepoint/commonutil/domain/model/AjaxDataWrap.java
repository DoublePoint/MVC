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
	/**                                                                  
	 *                                                                    
	 */
	private static final long serialVersionUID = 1L;
	private List<T> dataList;
	private PageInfo pageInfo;

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

	public <R extends BaseModel> AjaxDataWrap<R> copy(Class<R> targetClass) {
		AjaxDataWrap<R> ajaxDataWrap = new AjaxDataWrap<>();
		ajaxDataWrap.setPageInfo(this.pageInfo);
		ajaxDataWrap.setDataList(CommonBeanUtils.copyTo(this.dataList, targetClass));
		return ajaxDataWrap;
	}

	@SuppressWarnings("unchecked")
	public void getFromJsonObject(JSONObject jsonObject,Class modelClass) {
		Field[] fields = this.getClass().getDeclaredFields();
		dataList = new ArrayList<>();
		Stream.of(fields).forEach(field -> {
			field.setAccessible(true);
			String fieldName = field.getName();
			Class<?> fieldType = field.getType();
			try {
				
				JSONArray jsonArray = jsonObject.getJSONArray(fieldName);
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject modelObject = jsonArray.getJSONObject(i);

					//ParameterizedType genericType = (ParameterizedType)field.getGenericType();
					// 得到泛型里的class类型对象
					//Class<?> genericClazz = (Class<?>) genericType.getActualTypeArguments()[0];
					T t=(T) modelClass.newInstance();
					Method method1 = modelClass.getMethod("getFromJsonObject", JSONObject.class);
					method1.invoke(t, modelObject);
					//field.set(this, modelObject);
					dataList.add(t);
				}
				
//				if (genericType instanceof ParameterizedType) {
//					ParameterizedType pt = (ParameterizedType) genericType;
//					// 得到泛型里的class类型对象
//					Class<?> genericClazz = (Class<?>) pt.getActualTypeArguments()[0];
//					Object object = genericClazz.newInstance();
//					
//					dataList.add(object);
//				}
				BeanUtils.copyProperties(jsonObject.get(fieldName), dataList);
				field.set(this, dataList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
}
