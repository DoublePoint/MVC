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

import java.io.BufferedReader;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import cn.doublepoint.commonutil.domain.model.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseRequestController;

public class DataEncapsulateIntecerptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle run!");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//封装返回结果
		encapsulateResponseData(request, response, handler,modelAndView);
		System.out.println("postHandle run!");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion run!");
	}

	/**
	 * 封装返回结果
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 */
	private void encapsulateRequestData(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView){
		try {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
	        Object bean = handlerMethod.getBean();
	        if(bean instanceof BaseRequestController){
	        	BaseRequestController requestController= (BaseRequestController)bean;
	     		AjaxResponse responseData=requestController.getResponseData();
	     		
	     		if(modelAndView==null)
						modelAndView=new ModelAndView();
	     		modelAndView.addObject("LLAjaxResponse",  JSON.toJSONString(responseData));
	        }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 封装返回结果,将数据封装成固定格式的请求结果 以便在jsp中通过封装的脚本可以直接获取数据
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 */
	private void encapsulateResponseData(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView){
		try {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
	        Object bean = handlerMethod.getBean();
	        if(bean instanceof BaseRequestController){
	        	BaseRequestController requestController= (BaseRequestController)bean;
	     		AjaxResponse responseData=requestController.getResponseData();
	     		if(responseData==null)
	     			return;
	     		if(modelAndView==null)
						modelAndView=new ModelAndView();
	     		modelAndView.addObject("LLAjaxResponse",  JSON.toJSONString(responseData));
	        }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
