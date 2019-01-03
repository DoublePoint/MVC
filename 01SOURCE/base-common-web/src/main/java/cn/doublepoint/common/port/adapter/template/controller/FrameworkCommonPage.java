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

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.util.DropBeanUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.commonutil.ajaxmodel.DropBean;

@Controller
public class FrameworkCommonPage {

	@RequestMapping("sys/dropdown/datalist")
	@ResponseBody
	public AjaxDataPacket<DropBean> assistant(@RequestParam(required=false) String dropName) {
		AjaxDataPacket<DropBean> dataPacket=new AjaxDataPacket<>();
		List<DropBean> dropBeans=DropBeanUtil.findDropList(dropName);
		dataPacket.setDataList(dropBeans);
		return dataPacket;
	}
	
}
