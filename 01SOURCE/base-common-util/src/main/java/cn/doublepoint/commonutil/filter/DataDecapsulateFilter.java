/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：页面请求过滤器，用来对请求的数据进行过滤操作包括以下几部分内容
* 1：区分上传文件以及其他请求类别
* 2：格式化请求JSON，默认将数据封装成统一的格式，并且给即将请求的Handler默认初始化的值
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

public class DataDecapsulateFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String contentType = request.getContentType();// 获取请求的content-type
		if (contentType == null) {
			filterChain.doFilter(request, response);
			return;
		}
		//如果是上传文件请求
		if (contentType.contains("multipart/form-data")) {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
			MultipartHttpServletRequest multiReq = multipartResolver.resolveMultipart(request);
			filterChain.doFilter(multiReq, response);
		} else {
			ServletRequest requestWrapper = null;
			if (request instanceof HttpServletRequest) {
				requestWrapper = new BodyReaderHttpServletRequestWrapper((HttpServletRequest) request);
			}
			if (null == requestWrapper) {
				filterChain.doFilter(request, response);
				return;
			}
			filterChain.doFilter(requestWrapper, response);
			// BufferedReader br = requestWrapper.getReader();
			// if (br == null) {
			// filterChain.doFilter(requestWrapper, response);
			// return;
			// }
			// String str = null, retStr = "";
			// while ((str = br.readLine()) != null) {
			// retStr += str;
			// }
			//
			// String ip = requestWrapper.getRemoteAddr();
			// StringBuffer url = ((HttpServletRequest)
			// request).getRequestURL();
			// JSONObject jo = new JSONObject();
			// jo.put("ip", ip);
			// jo.put("url", url.toString());
			// jo.put("content", retStr);
			// logger.info(jo);
			// filterChain.doFilter(requestWrapper, response);
		}

	}

}
