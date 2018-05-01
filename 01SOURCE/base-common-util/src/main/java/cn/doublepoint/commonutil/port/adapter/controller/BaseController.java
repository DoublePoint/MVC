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

import cn.doublepoint.commonutil.domain.model.AjaxResponse;

public class BaseController {
	public AjaxResponse responseData;
	
	public BaseController(){
		responseData=new AjaxResponse();
	}
	
	@ExceptionHandler  
	@ResponseBody
    public AjaxResponse exp(HttpServletRequest request, Exception ex) { 
		AjaxResponse response=new AjaxResponse();
		response.setCode("-1");
		response.setErrorMessage("发生数据错误，ayer 采用 MIT 开源许可证，将会永久性提供无偿服务。因着数年的坚持维护，截至到2017年9月13日，已运用在超过 30万 家 Web 平台，其中不乏众多知名大型网站。目前 layer 已经成为国内乃至全世界最多人使用的 Web 弹层解决方案");
		return response;
    }

	public AjaxResponse getResponseData() {
		return responseData;
	}

	public void setResponseData(AjaxResponse responseData) {
		this.responseData = responseData;
	}
	
	
}
