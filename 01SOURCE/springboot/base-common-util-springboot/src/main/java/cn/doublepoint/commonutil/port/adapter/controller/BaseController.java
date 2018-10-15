/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月15日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.port.adapter.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.log.Log4jUtil;

public class BaseController {
	@ExceptionHandler  
	@ResponseBody
    public AjaxResponse exp(HttpServletRequest request, Exception ex) { 
		AjaxResponse response=new AjaxResponse();
		response.setCode("-1");
		response.setErrorMessage(ex.toString());
		Log4jUtil.error(ex);
		return response;
    }
}
