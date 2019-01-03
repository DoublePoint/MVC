///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2018年5月1日
//* 
//* 类   说   明 ：
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package cn.doublepoint.commonutil.filter;
//
//import java.io.BufferedReader;
//import java.io.ByteArrayInputStream;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.URLDecoder;
//import java.nio.charset.Charset;
//import java.text.SimpleDateFormat;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.stream.Stream;
//
//import javax.servlet.ReadListener;
//import javax.servlet.ServletInputStream;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequestPacketper;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.fasterxml.jackson.databind.DeserializationFeature;
//import com.fasterxml.jackson.databind.JavaType;
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//import cn.doublepoint.commonutil.StringUtil;
//import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
//import cn.doublepoint.commonutil.log.Log4jUtil;
//import cn.doublepoint.template.dto.domain.model.entity.BaseModel;
//
///**
// * 1、对于Ajax 数据直接封装到json对象中，对于form.submit由于this.body为空，所以json对象为null
// * 2、获取参数首先从super.parameter中读取，String和AjaxDataPacket分别转义，再从json对象中取，最后从map中取
// * @author Administrator
// *
// */
//public class BodyReaderHttpServletRequestPacketper extends HttpServletRequestPacketper {
//	private final byte[] body;
//	private Map<String, Object> map;
//	private JSONObject jsonObject;
//
//	public BodyReaderHttpServletRequestPacketper(HttpServletRequest request) throws IOException {
//		super(request);
//		map = new HashMap<String, Object>();
//		body = readBytes(request.getReader(), "utf-8");
//		translateFomrDataToJsonMap();
//	}
//
//	@Override
//	public BufferedReader getReader() throws IOException {
//		ServletInputStream inputStream = getInputStream();
//		if (inputStream == null)
//			return null;
//		return new BufferedReader(new InputStreamReader(getInputStream()));
//	}
//
//	/**
//	 * 获取参数
//	 */
//	@Override
//	public String getParameter(String parameterName) {
//		if (super.getParameter(parameterName) != null)
//			return super.getParameter(parameterName);
//		if (jsonObject != null) {
//			if (jsonObject.get(parameterName) != null)
//				return String.valueOf(jsonObject.get(parameterName));
//		}
//		Object valObj = map.get(parameterName);
//		if (valObj == null)
//			return "";
//		String val = valObj.toString();
//		try {
//
//			if ((val.startsWith("\"") && val.endsWith("\"")) || (val.startsWith("'") && val.endsWith("'")))
//				return val.substring(1, val.length() - 1);
//			return val;
//		} catch (Exception e) {
//			Log4jUtil.warn(e);
//			return val;
//		}
//	}
//
//	/**
//	 * 获取ajaxdataPacket
//	 * 
//	 * @param ajaxDataPacketName
//	 * @param clazz
//	 * @return
//	 */
//	public <T  extends BaseModel> AjaxDataPacket<T> getAjaxDataPacket(String ajaxDataPacketName, Class<T> clazz) {
//		
//		//1.从父中获取
//		String dataPacketJsonString=super.getParameter(ajaxDataPacketName);
//		if(!StringUtil.isNullOrEmpty(dataPacketJsonString)){
//			return translateJsonStringToAjaxDataPacket(dataPacketJsonString, clazz);
//		}
//		
//		//2.从json对象中获取
//		dataPacketJsonString = "";
//		JSONObject obj = null;
//		if (jsonObject != null)
//			obj = jsonObject.getJSONObject(ajaxDataPacketName);
//		try {
//			if (obj == null) {
//				Object wrapObj = map.get(ajaxDataPacketName);
//				if (wrapObj == null)
//					return new AjaxDataPacket<T>();
//				dataPacketJsonString = String.valueOf(wrapObj);
//				obj = JSON.parseObject(dataPacketJsonString);
//			}
//		} catch (Exception e) {
//			Log4jUtil.error(e);
//		}
//		return translateJsonStringToAjaxDataPacket(obj.toJSONString(), clazz);
//	}
//
//	@Override
//	public ServletInputStream getInputStream() throws IOException {
//		if (body == null)
//			return null;
//		final ByteArrayInputStream bais = new ByteArrayInputStream(body);
//		return new ServletInputStream() {
//
//			@Override
//			public int read() throws IOException {
//				return bais.read();
//			}
//
//			@Override
//			public boolean isFinished() {
//				return false;
//			}
//
//			@Override
//			public boolean isReady() {
//				return false;
//			}
//
//			@Override
//			public void setReadListener(ReadListener readListener) {
//			}
//		};
//	}
//
//	public byte[] getBody() {
//		return body;
//	}
//
//	/**
//	 * 通过BufferedReader和字符编码集转换成byte数组
//	 * 
//	 * @param br
//	 * @param encoding
//	 * @return
//	 * @throws IOException
//	 */
//	private byte[] readBytes(BufferedReader br, String encoding) throws IOException {
//		String str = null, retStr = "";
//		while ((str = br.readLine()) != null) {
//			retStr += str;
//		}
//		if (!StringUtil.isNullOrEmpty(retStr)) {
//			return retStr.getBytes(Charset.forName(encoding));
//		}
//		return null;
//	}
//
//	/**
//	 * 将FomnData类型的数据转换成Json
//	 */
//	private void translateFomrDataToJsonMap() {
//		//方法体参数
//		if (this.body == null)
//			return;
//		String bodyString = new String(body);
//		System.out.println("bodyString-----" + bodyString);
//		try {
//			jsonObject = JSON.parseObject(bodyString);
//		} catch (Exception e) {
//			Log4jUtil.warn(e);
//		}
//
//		try {
//			//地址栏参数
//			String formdataString = URLDecoder.decode(new String(body), "UTF-8");
//			System.out.println(formdataString);
//			String[] strings = formdataString.split("&");
//			if (strings != null) {
//				Stream.of(strings).forEach(item -> {
//					int startIndex = item.indexOf("=");
//					String key = item.substring(0, startIndex);
//					String value = item.substring(startIndex + 1);
//					map.put(key, value);
//				});
//			}
//		} catch (Exception e) {
//			Log4jUtil.warn(e);
//		}
//	}
//
//	private <T  extends BaseModel> AjaxDataPacket<T> translateJsonStringToAjaxDataPacket(String jsonString,Class clazz){
//		ObjectMapper mspp = new ObjectMapper();
//		mspp.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
//		mspp.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//		JavaType type = mspp.getTypeFactory().constructParametricType(AjaxDataPacket.class, clazz);
//		try {
//			AjaxDataPacket<T> dataPacket = mspp.readValue(jsonString, type);
//			if(dataPacket==null)
//				dataPacket=new AjaxDataPacket<T>();
//			return dataPacket;
//		} catch (Exception e) {
//			Log4jUtil.error(e);
//			return new AjaxDataPacket<T>();
//		}
//	}
//}
