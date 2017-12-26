/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月25日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.util.domain.model;

import java.util.List;

public class BaseModel {
	public String getUpdateSql() {
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
	}
}
