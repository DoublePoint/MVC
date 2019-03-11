/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2019年3月11日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.filemanagement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.file.SysFileUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysFile;

@Controller
@RequestMapping("/sys/file")
public class FileManagementController {

	@RequestMapping("upload")
	@ResponseBody
	public AjaxResponse upload(HttpServletRequest request, MultipartFile[] file) {
		SysFile result =null;
		try {
			if (file != null && file.length > 0) {
				for (MultipartFile multipartFile : file) {
					result = SysFileUtil.uploadFile(multipartFile, "123");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new AjaxResponse();
		}
		AjaxResponse response = new AjaxResponse();
		response.setAjaxParameter("file", result);
		return response;
	}
	

	@RequestMapping("download/{id}")
	@ResponseBody
	public AjaxResponse upload(@PathVariable Integer id,HttpServletResponse response) {
		try {
			SysFile sysFile = JPAUtil.loadById(SysFile.class, id);
			String serverPath = sysFile.getServerPath();
			SysFileUtil.download(response, serverPath, "test");
		} catch (Exception e) {
			e.printStackTrace();
			return new AjaxResponse();
		}
		return null;
	}
}