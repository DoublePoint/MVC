/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.controller.code;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.common.port.adapter.template.persistence.sys.code.CodeService;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.Code;

@Controller
@RequestMapping("sys/code")
public class CodeManagementController extends BaseController {

	@Autowired
	CodeService service;

	// 菜单页面
	@RequestMapping("/")
	public String cd(HttpServletRequest request) {
		return "sys/code/code.html";
	}

	/**
	 * 查询详细信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/retrieve-detail")
	@ResponseBody
	public AjaxResponse retrieve(@RequestBody AjaxRequest request) {
		AjaxDataWrap<Code> dataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
		if (dataWrap == null)
			return null;
		Code menuQuery = dataWrap.getData();
		List<Code> list = service.findByClassify(menuQuery.getClassify());
		dataWrap.setDataList(list);

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}
	
	/**
	 * 查询代码类别
	 * @param request
	 * @return
	 */
	@RequestMapping("/retrieve-classify")
	@ResponseBody
	public AjaxResponse retrieveClassify(@RequestBody AjaxRequest request) {
		AjaxDataWrap<Code> dataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
		if (dataWrap == null)
			return null;
		Code menuQuery = dataWrap.getData();
		List<Code> list = service.findClassify(menuQuery, dataWrap.getPageInfo());
		dataWrap.setDataList(list);

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("dataWrap", dataWrap);
		return ajaxResponse;
	}

	/**
	 * 主保存
	 * @param request
	 * @return
	 */
	@RequestMapping("/save-main")
	@ResponseBody
	public AjaxResponse save(@RequestBody AjaxRequest request) {
//		AjaxDataWrap<Code> addDataWrap = request.getAjaxDataWrap("addDataWrap", Code.class);
		AjaxDataWrap<Code> updateDataWrap = request.getAjaxDataWrap("updateDataWrap", Code.class);
//		if (addDataWrap != null){
//			service.saveOrUpdate(addDataWrap.getDataList());
//		}
		if(updateDataWrap != null){
			service.updateByClassify(updateDataWrap.getDataList());
		}
		return new AjaxResponse();
	}

	/**
	 * 详情保存
	 * @param request
	 * @return
	 */
	@RequestMapping("/save-detail")
	@ResponseBody
	public AjaxResponse saveDetail(@RequestBody AjaxRequest request){
		AjaxDataWrap<Code> addDataWrap = request.getAjaxDataWrap("addDataWrap", Code.class);
		AjaxDataWrap<Code> updateDataWrap = request.getAjaxDataWrap("updateDataWrap", Code.class);
		if (addDataWrap != null){
			service.saveOrUpdate(addDataWrap.getDataList());
			service.saveOrUpdate(updateDataWrap.getDataList());
		}
		return new AjaxResponse();
	}
	/**
	 * 删除明细信息
	 * @param request
	 * @param responseData
	 * @return
	 */
	@RequestMapping("/delete-detail")
	@ResponseBody
	public AjaxResponse delete(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataWrap<Code> deleteDataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
		if (deleteDataWrap == null)
			return null;
		List<Code> menuList = deleteDataWrap.getDataList();
		service.remove(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
	
	/**
	 * 根据代码类别删除
	 * @param request
	 * @param responseData
	 * @return
	 */
	@RequestMapping("delete-by-classify")
	@ResponseBody
	public AjaxResponse deleteByClassify(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		AjaxDataWrap<Code> deleteDataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
		if (deleteDataWrap == null)
			return null;
		List<Code> menuList = deleteDataWrap.getDataList();
		service.removeByClassify(menuList);
		responseData.setAjaxParameter("deleteState", true);
		return responseData;
	}
	
	/**
	 * 根据代码类别更新
	 * @param request
	 * @param responseData
	 * @return
	 */
	@RequestMapping("update-by-classify")
	@ResponseBody
	public AjaxResponse updateByClassify(@RequestBody AjaxRequest request, AjaxResponse responseData) {
		try{
			AjaxDataWrap<Code> dataWrap = request.getAjaxDataWrap("dataWrap", Code.class);
			if (dataWrap == null)
				return null;
			Code code = dataWrap.getData();
			service.updateByClassify(code);
		}
		catch(Exception e){
			responseData.setErrorMessage("更新失败");
		}
		
		return responseData;
	}
}
