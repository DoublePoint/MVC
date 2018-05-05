/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月25日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.domain.model;

import java.lang.reflect.Field;
import java.util.stream.Stream;

import com.alibaba.fastjson.JSONObject;

public class BaseModel {
	public int rowId=-1;

	public int getRowId() {
		return rowId;
	}

	public void setRowId(int rowId) {
		this.rowId = rowId;
	}
	
	/*public String getUpdateSql() {
		return null;
	}
	public String getInsertSql() {
		return null;
	}
	public String getSelectSql() {
		return null;
	}
	public <T> List<Object[]> getQueryParamList(List<T> queryModelList) {
		return null;
	}*/
	
	public void getFromJsonObject(JSONObject jsonObject){
		Field[] fields = this.getClass().getDeclaredFields();
		Stream.of(fields).forEach(field -> {
			try {
				field.setAccessible(true);
				field.set(this, jsonObject.get(field.getName()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
}
