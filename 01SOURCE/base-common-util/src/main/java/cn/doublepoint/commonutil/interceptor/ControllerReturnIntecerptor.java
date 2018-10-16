/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.HandlerInterceptor;

import com.alibaba.fastjson.JSON;

import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;

/*<!-- 执行完Controller中的方法调用拦截器 HandleMethodInteceptor -->*/

@Component
public class ControllerReturnIntecerptor implements HandlerMethodReturnValueHandler,HandlerInterceptor{

	/**
	 * 该处理程序是否支持给定的方法返回类型(只有返回true才回去调用handleReturnValue)
	 */
	@Override
	public boolean supportsReturnType(MethodParameter methodParameter) {
		return methodParameter.getParameterType() == AjaxResponse.class;
	}
	

	/**
	 * 处理给定的返回值 通过向 ModelAndViewContainer 添加属性和设置视图或者 通过调用
	 * ModelAndViewContainer.setRequestHandled(true) 来标识响应已经被直接处理(不再调用视图解析器)
	 */
	@Override
	public void handleReturnValue(Object o, MethodParameter methodParameter,
			ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest) throws Exception {
		HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
		if(isAjaxRequest(request))
			return;
		methodParameter.getParameterName();
		Assert.isInstanceOf(AjaxResponse.class, o);
		AjaxResponse responseData = ((AjaxResponse) o);
		/**
		 * 标识请求是否已经在该方法内完成处理
		 */
//		modelAndViewContainer.setRequestHandled(true);
		modelAndViewContainer.setViewName(responseData.getViewName());
		modelAndViewContainer.getDefaultModel().put("LLAjaxResponse", JSON.toJSONString(responseData));
//		
////		HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
//		HttpServletResponse response = nativeWebRequest.getNativeResponse(HttpServletResponse.class);
//		response.getWriter().write(JSON.toJSONString(responseData));
//		response.getWriter().flush();
	}
	
	private boolean isAjaxRequest(HttpServletRequest request) {
		return request.getHeader("x-requested-with") != null
				&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest");
	}
}
