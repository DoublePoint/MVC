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

import cn.doublepoint.common.port.adapter.template.persistence.sys.common.DropBeanUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.DropBean;

@Controller
public class FrameworkCommonPage {

	@RequestMapping("/template/sys/dropdown/datalist")
	@ResponseBody
	public AjaxDataWrap<DropBean> assistant(@RequestParam(required=false) String dropName) {
		AjaxDataWrap<DropBean> dataWrap=new AjaxDataWrap<>();
		List<DropBean> dropBeans=new DropBeanUtil().getDropListBySql("");
//		List<DropBean> dropBeans=new ArrayList<>();
//		DropBean dBean1=new DropBean();
//		dBean1.setValue("1");
//		dropBeans.add(dBean1);
//		DropBean dBean2=new DropBean();
//		dBean2.setValue("2");
//		dropBeans.add(dBean2);
//		DropBean dBean3=new DropBean();
//		dBean3.setValue("3");
//		dropBeans.add(dBean3);
//		DropBean dBean4=new DropBean();
//		dBean4.setValue(dropName);
//		dropBeans.add(dBean4);
		dataWrap.setDataList(dropBeans);
		return dataWrap;
	}
	
	@RequestMapping("/ll/commonpage/")
	public List<DropBean> getDropList(@RequestParam(required=true) String dropName){
		List<DropBean> list=new DropBeanUtil().getDropListBySql("");
		return null;
	}
}
