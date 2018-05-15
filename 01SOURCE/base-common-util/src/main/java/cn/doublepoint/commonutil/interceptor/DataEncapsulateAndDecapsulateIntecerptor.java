/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：
* 1：格式化请求JSON，默认将数据封装成统一的格式，并且给即将请求的Handler默认初始化的值
* 2：格式化相应JSON，默认将数据封装成统一的格式
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.text.SimpleDateFormat;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.AjaxResponse;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;

public class DataEncapsulateAndDecapsulateIntecerptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 解封装所有参数
		decapsulateRequestData(request, response, handler);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 封装返回结果
		encapsulateResponseData(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	/**
	 * 解封装请求参数 将传过来的数据进行解析 并给handler中的数据赋值 不需要进行request.get进行获取
	 * 
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 */
	private void decapsulateRequestData(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			Object bean = ((HandlerMethod) handler).getBean();
			if (bean instanceof BaseController) {
				BaseController controller = (BaseController) bean;
				initHandlerField(request, controller);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 初始化Handler的各个字段，给其赋值(前台传来的值)
	 * 
	 * @param request
	 * @param controller
	 */
	private void initHandlerField(HttpServletRequest request, BaseController controller) {
		Field[] fields = controller.getClass().getDeclaredFields();
		if (request.getMethod().equalsIgnoreCase("post")) {
			// 循环遍历Handler 设置Controller中各个字段的值
			Stream.of(fields).forEach(field -> {
				field.setAccessible(true);
				String fieldName = field.getName();
				Class<?> fieldType = field.getType();
				try {
					// 如果是上传文件类型 则需要将Request进行转换，通过request.getFile来获取数据
					if (request instanceof MultipartHttpServletRequest && fieldType.equals(MultipartFile.class)) {
						MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
						field.set(controller, req.getFile(fieldName));
						return;
					}
					// 如果过是其他类型 直接通过getParameter就可获取数据
					if (request instanceof BodyReaderHttpServletRequestWrapper) {
						if (fieldType == AjaxDataWrap.class) {
							decapsulateAjaxDataWrap(request, controller, field);
						} else {
							decapsulateBasicData(request, controller, field);
						}
						return;
					} else {
						decapsulateBasicData(request, controller, field);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
		} else {
			// 循环遍历Handler 设置Controller中各个字段的值
			Stream.of(fields).forEach(field -> {
				field.setAccessible(true);
				try {
					decapsulateBasicData(request, controller, field);
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
		}
	}

	/**
	 * 封装返回结果,将数据封装成固定格式的请求结果 以便在jsp中通过封装的脚本可以直接获取数据
	 * 
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 */
	private void encapsulateResponseData(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {
		try {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Object bean = handlerMethod.getBean();
			if (bean instanceof BaseTreeController) {
				return;
			}
			if (bean instanceof BaseController) {
				// 表明是Ajax请求
				if (request.getHeader("x-requested-with") != null
						&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
					System.out.println(request.getHeader("Accept"));
					 if(response.getHeader("Content-Type").indexOf("application/octet-stream") != -1)
							return;
					// 说明期望请求返回类型为Json
					else if (request.getHeader("Accept") == null|| request.getHeader("Accept").indexOf("application/json") != -1)
						encapsulateAjaxResponseData(request, response, handler, bean, modelAndView);
					
					else { // 说明期望请求为 html或者其他
						encapsulatePageRequestResponseData(request, response, handler, bean, modelAndView);
					}
				} else {
					encapsulatePageRequestResponseData(request, response, handler, bean, modelAndView);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 如果是ajax请求响应头会有x-requested-with
	 * 
	 * @param request
	 * @param response
	 * @param handler
	 * @param bean
	 * @throws IOException
	 */
	private void encapsulateAjaxResponseData(HttpServletRequest request, HttpServletResponse response, Object handler,
			Object bean, ModelAndView modelAndView) throws IOException {
		BaseController requestController = (BaseController) bean;
		AjaxResponse responseData = requestController.getResponseData();
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		writer.println(JSON.toJSONString(responseData));
		writer.flush();
		writer.close();

	}

	/**
	 * 拆包 前台传来的DataWrapJsonObject
	 * 
	 * @param request
	 * @param controllerField
	 * @param field
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws InvocationTargetException
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 */
	@SuppressWarnings({ "rawtypes" })
	private void decapsulateAjaxDataWrap(HttpServletRequest request, BaseController controller, Field field)
			throws IllegalArgumentException, IllegalAccessException, InstantiationException, NoSuchMethodException,
			SecurityException, InvocationTargetException, JsonParseException, JsonMappingException, IOException {
		Field wrapField = field;
		String fieldName = wrapField.getName();
		Class ajaxDataWrapType = wrapField.getType();
		ParameterizedType genericType = (ParameterizedType) wrapField.getGenericType();
		Class<?> baseModelClass = (Class<?>) genericType.getActualTypeArguments()[0];
		BodyReaderHttpServletRequestWrapper requestWrapper = (BodyReaderHttpServletRequestWrapper) request;
		if (requestWrapper.getJSONObject() == null)
			return;
		if (requestWrapper.getJSONObject().getJSONObject(fieldName) == null)
			return;
		String jsobString = requestWrapper.getJSONObject().getJSONObject(fieldName).toJSONString();
		ObjectMapper mspp = new ObjectMapper();
		mspp.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		mspp.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		JavaType type = mspp.getTypeFactory().constructParametricType(ajaxDataWrapType, baseModelClass);
		Object oo = mspp.readValue(jsobString, type);
		wrapField.set(controller, oo);
	}

	/**
	 * 拆包 前台传来的基本数据类型
	 * 
	 * @param request
	 * @param controller
	 * @param field
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	private void decapsulateBasicData(HttpServletRequest request, BaseController controller, Field field)
			throws IllegalArgumentException, IllegalAccessException {
		String fieldName = field.getName();
		if (request.getParameter(fieldName) != null)
			field.set(controller, request.getParameter(fieldName));
		return;

	}

	/**
	 * 封装页面请求时的数据
	 * 
	 * @param request
	 * @param response
	 * @param handler
	 * @param bean
	 * @param modelAndView
	 */
	private void encapsulatePageRequestResponseData(HttpServletRequest request, HttpServletResponse response,
			Object handler, Object bean, ModelAndView modelAndView) {
		BaseController requestController = (BaseController) bean;
		AjaxResponse responseData = requestController.getResponseData();
		if (responseData == null)
			return;
		if (modelAndView == null)
			modelAndView = new ModelAndView();
		modelAndView.addObject("LLAjaxResponse", JSON.toJSONString(responseData));
	}

}
