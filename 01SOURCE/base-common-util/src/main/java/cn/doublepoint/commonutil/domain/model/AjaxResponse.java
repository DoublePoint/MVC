/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月27日
* 
* 类   说   明 ： Ajax请求返回类型 可以用作统一返回类型 以便于让前台进行错误统一弹窗
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.domain.model;

import java.util.HashMap;
import java.util.Map;

public class AjaxResponse {
	
	private Map<String, Object> parameterMap;
	
	public AjaxResponse(){
		if(parameterMap==null)
			parameterMap=new HashMap<>();
	}
	
	/**
	 * 设置参数列表
	 * @param paramName 参数名
	 * @param paramValue 参数值
	 */
	public void setAjaxParameter(String paramName,Object paramValue){
		if(parameterMap.containsKey(paramName)){
			parameterMap.remove(paramName);
		}
		parameterMap.put(paramName, paramValue);
	}

	public Map<String, Object> getParameterMap() {
		return parameterMap;
	}

	public void setParameterMap(Map<String, Object> parameterMap) {
		this.parameterMap = parameterMap;
	}
	
	
}
