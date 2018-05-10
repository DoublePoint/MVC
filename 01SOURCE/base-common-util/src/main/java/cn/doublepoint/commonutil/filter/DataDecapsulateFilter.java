/** 

* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：页面请求过滤器，用来对请求的数据进行过滤操作包括以下几部分内容
* 1：区分上传文件以及其他请求类别
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import cn.doublepoint.commonutil.domain.model.Log4jUtil;

public class DataDecapsulateFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		Log4jUtil.info("Do fileter internal.");
		String contentType = request.getContentType();// 获取请求的content-type
		if (contentType == null) {
			//filterChain.doFilter(request, response);
			doOtherRequest(request,response,filterChain);
			return;
		}
		//如果是上传文件请求
		if (contentType.contains("multipart/form-data")) {
			doFileUploadRequest(request,response,filterChain);
		} else {
			doOtherRequest(request,response,filterChain);
		}
		
	}
	
	/**
	 * 梳理上传文件方式的请求
	 * @param request
	 * @param response
	 * @param filterChain
	 * @throws IOException
	 * @throws ServletException
	 */
	private void doFileUploadRequest(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException{
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		MultipartHttpServletRequest multiReq = multipartResolver.resolveMultipart(request);
		filterChain.doFilter(multiReq, response);
	}

	/**
	 * 处理其他方式的的请求
	 * @param request
	 * @param response
	 * @param filterChain
	 * @throws IOException
	 * @throws ServletException
	 */
	private void doOtherRequest(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException{
		ServletRequest requestWrapper = null;
		if (request instanceof HttpServletRequest) {
			requestWrapper = new BodyReaderHttpServletRequestWrapper((HttpServletRequest) request);
		}
		if (null == requestWrapper) {
			filterChain.doFilter(request, response);
			return;
		}
		filterChain.doFilter(requestWrapper, response);
	}
}
