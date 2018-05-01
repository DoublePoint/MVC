/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.filter;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.alibaba.fastjson.JSONObject;

public class DataDecapsulateFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		ServletRequest requestWrapper = null;
		if (request instanceof HttpServletRequest) {
			requestWrapper = new BodyReaderHttpServletRequestWrapper((HttpServletRequest) request);
		}
		if (null == requestWrapper) {
			filterChain.doFilter(request, response);
		} else {
			BufferedReader br = requestWrapper.getReader();
			if(br==null){
				filterChain.doFilter(request, response);
				return;
			}
			String str = null, retStr = "";
			while ((str = br.readLine()) != null) {
				retStr += str;
			}

			String ip = requestWrapper.getRemoteAddr();
			StringBuffer url = ((HttpServletRequest) request).getRequestURL();
			JSONObject jo = new JSONObject();
			jo.put("ip", ip);
			jo.put("url", url.toString());
			jo.put("content", retStr);
			logger.info(jo);
			filterChain.doFilter(requestWrapper, response);
		}
	}

}
