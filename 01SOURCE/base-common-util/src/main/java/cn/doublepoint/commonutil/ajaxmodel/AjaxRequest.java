/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.ajaxmodel;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.commonutil.log.Log4jUtil;
import cn.doublepoint.dto.domain.model.entity.BaseModel;

public class AjaxRequest {
	
	public AjaxRequest(){
		this.map=new HashMap<String,Object>();
	}
	
	private Map<String,Object> map;

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	public Object getMap(String key) {
		return map.get(key);
	}
	
	public String getParameter(String parameterName){
		if(map==null)
			return null;
		if(map.get(parameterName)==null)
			return null;
		return map.get(parameterName).toString();
	}
	
	public <T extends BaseModel> AjaxDataPacket<T> getAjaxDataPacket(String parameterName,Class<T> clazz){
		if(map==null)
			return new AjaxDataPacket<T>();
		if(map.get(parameterName)==null)
			return new AjaxDataPacket<T>();
		
		String jsonString=JSONObject.toJSONString(map.get(parameterName));
		ObjectMapper mspp = new ObjectMapper();
		mspp.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		mspp.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		JavaType type = mspp.getTypeFactory().constructParametricType(AjaxDataPacket.class, clazz);
		try {
			AjaxDataPacket<T> dataPacket=mspp.readValue(jsonString, type);
			return dataPacket;
		} catch (Exception e) {
			Log4jUtil.error(e);
			return new AjaxDataPacket<T>();
		}
	}
}
