/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年3月31日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.generate;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.doublepoint.common.domain.model.entity.sys.MySQLTables;
import cn.doublepoint.common.port.adapter.template.persistence.sys.common.DataBaseMetaDataUtil;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;
import cn.doublepoint.generate.GenerateEntityUtil;

@Controller
public class GenerateEntityController extends BaseHandleController {

	@RequestMapping("/template/sys/tables")
	@ResponseBody
	public AjaxDataWrap<MySQLTables> getTables() {
		List<MySQLTables> list = DataBaseMetaDataUtil.getTables();
		AjaxDataWrap<MySQLTables> dataWrap = new AjaxDataWrap<>();
		dataWrap.setDataList(list);
		return dataWrap;
	}

	@RequestMapping("/template/sys/uploadfile")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile myfile)
			throws IllegalStateException, IOException {
		String returnString="";
		try {
			File file = File.createTempFile("tmp", null);
			myfile.transferTo(file);
			returnString=GenerateEntityUtil.buildEntityByTableName(file, "menu");
			file.deleteOnExit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnString;
		
//		// 原始名称
//		String oldFileName = myfile.getOriginalFilename(); // 获取上传文件的原名
//		// System.out.println(oldFileName);
//		// 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
//		String saveFilePath = "F://AllProject//01SOURCE//base-web-bootstrap//tmp//spittr//uploads";
//		// 上传图片
//		if (myfile != null && oldFileName != null && oldFileName.length() > 0) {
//			// 新的图片名称
//			String newFileName = "123" + oldFileName.substring(oldFileName.lastIndexOf("."));
//			// 新图片
//			File newFile = new File(saveFilePath + "//" + newFileName);
//			// 将内存中的数据写入磁盘
//			myfile.transferTo(newFile);
//			// 将新图片名称返回到前端
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("success", "成功啦");
//			map.put("url", newFileName);
//			return map;
//		} else {
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("error", "图片不合法");
//			return map;
//		}
	}
}
