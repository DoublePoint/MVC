/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil.port.adapter.controller.handle;

import org.springframework.stereotype.Controller;

import cn.doublepoint.commonutil.domain.model.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;

@Controller
public class BaseHandleController implements BaseController{
	public AjaxResponse responseData;
	
	public BaseHandleController(){
		responseData=new AjaxResponse();
	}
}
