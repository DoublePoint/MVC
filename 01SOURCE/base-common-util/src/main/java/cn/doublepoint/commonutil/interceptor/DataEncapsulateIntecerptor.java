/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.interceptor;

import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import cn.doublepoint.commonutil.domain.model.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;

public class DataEncapsulateIntecerptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//解封装所有参数
		decapsulateResponseData(request, response, handler);
		System.out.println("preHandle run!");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 封装返回结果
		encapsulateResponseData(request, response, handler, modelAndView);
		System.out.println("postHandle run!");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		System.out.println("afterCompletion run!");
	}

	/**
	 * 封装返回结果,将数据封装成固定格式的请求结果 以便在jsp中通过封装的脚本可以直接获取数据
	 * 
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 */
	private void decapsulateResponseData(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Object bean = handlerMethod.getBean();
			if (bean instanceof BaseController) {
				BaseController requestController = (BaseController) bean;
				Field[] fields = requestController.getClass().getDeclaredFields();
				
				//循环遍历Handler 设置Controller中各个字段的值
				Stream.of(fields).forEach(field -> {
					field.setAccessible(true);
					String fieldName = field.getName();
					if (!StringUtil.isNullOrEmpty(fieldName)) 
						try {
							//如果是上传文件类型 则需要将Request进行转换，通过request.getFile来获取数据
							if(request instanceof MultipartHttpServletRequest&&field.getType().equals(MultipartFile.class)){
								MultipartHttpServletRequest req=(MultipartHttpServletRequest) request;
								field.set(bean, req.getFile(fieldName));
							}
							//如果过是其他类型 直接通过getParameter就可获取数据
							else{
								if(request.getParameter(fieldName)!=null)
									field.set(bean, request.getParameter(fieldName));
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
				});
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
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
			if(bean instanceof BaseTreeController){
				return;
			}
			if (bean instanceof BaseController) {
				BaseController requestController = (BaseController) bean;
				AjaxResponse responseData = requestController.getResponseData();
				if (request.getHeader("x-requested-with") != null
						&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) { // 如果是ajax请求响应头会有x-requested-with
					PrintWriter writer = response.getWriter();
					response.setContentType("application/json;charset=UTF-8");
					response.setCharacterEncoding("UTF-8");
					writer.println(JSON.toJSONString(responseData));
					writer.flush();
					writer.close();
				} else {
					if (responseData == null)
						return;
					if (modelAndView == null)
						modelAndView = new ModelAndView();
					modelAndView.addObject("LLAjaxResponse", JSON.toJSONString(responseData));

				}
			}
			// 如果是ajax请求

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
