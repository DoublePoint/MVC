/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年3月31日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.port.adapter.template.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.doublepoint.commonutil.domain.model.DropBean;

@Controller
public class FrameworkCommonPage {
	
	@RequestMapping("/ll/commonpage/")
	public List<DropBean> getDropList(@RequestParam(required=true) String dropName){
		List<DropBean> list=new ArrayList<DropBean>();
		return null;
	}
}
