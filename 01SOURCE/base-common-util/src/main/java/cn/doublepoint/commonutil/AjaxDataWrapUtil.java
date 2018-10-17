/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年10月17日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil;

import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.log.Log4jUtil;
import cn.doublepoint.template.dto.domain.model.entity.BaseModel;

public class AjaxDataWrapUtil {
	public static <T  extends BaseModel> AjaxDataWrap<T> translateJsonStringToAjaxDataWrap(String jsonString,Class clazz){
		ObjectMapper mspp = new ObjectMapper();
		mspp.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		mspp.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		JavaType type = mspp.getTypeFactory().constructParametricType(AjaxDataWrap.class, clazz);
		try {
			AjaxDataWrap<T> dataWrap = mspp.readValue(jsonString, type);
			if(dataWrap==null)
				dataWrap=new AjaxDataWrap<T>();
			return dataWrap;
		} catch (Exception e) {
			Log4jUtil.error(e);
			return new AjaxDataWrap<T>();
		}
	}
}
