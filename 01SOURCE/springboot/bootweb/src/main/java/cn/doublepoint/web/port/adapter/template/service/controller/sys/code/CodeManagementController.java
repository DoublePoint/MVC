/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.code;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.code.CodeService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.template.dto.domain.model.entity.sys.Code;

@Controller
@RequestMapping("sys/code")
public class CodeManagementController extends BaseController {

	@Autowired
	CodeService service;

	// 菜单页面
	@RequestMapping("/code")
	public String cd(HttpServletRequest request) {
		return "code";
	}

	@RequestMapping("/retrieve")
	@ResponseBody
	public AjaxResponse retrieve(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<Code> dataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
		if (dataWrap == null)
			return null;
		Code menuQuery = null;
		if (dataWrap.getDataList() != null && dataWrap.getDataList().size() > 0) {
			menuQuery = dataWrap.getDataList().get(0);
		}

		if (menuQuery != null) {
			List<Code> list = service.find(menuQuery, dataWrap.getPageInfo());
			dataWrap.setDataList(list);
		}

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	@RequestMapping("/add")
	@ResponseBody
	public AjaxResponse add(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<Code> addDataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
		if (addDataWrap == null)
			return null;
		service.saveOrUpdate(addDataWrap.getDataList());
		return new AjaxResponse();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse delete(BodyReaderHttpServletRequestWrapper request, AjaxResponse responseData) {
		AjaxDataWrap<Code> deleteDataWrap = request.getAjaxDataWrap("deleteDataWrap", Code.class);
		if (deleteDataWrap == null)
			return null;
		List<Code> menuList = deleteDataWrap.getDataList();
		service.remove(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
}
