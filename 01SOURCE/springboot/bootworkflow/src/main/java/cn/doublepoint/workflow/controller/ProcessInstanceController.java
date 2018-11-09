package cn.doublepoint.workflow.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.ProcessDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.dto.domain.model.vo.workflow.VOProcessDefinition;

/**
 * 流程管理控制器
 *
 * @author HenryYan
 */
@Controller
@RequestMapping(value = "oll/instance")
public class ProcessInstanceController {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	
	protected TaskService taskService;
	protected RepositoryService repositoryService;
	
	/**
	 * 获取流程状态
	 * @param processInstanceId
	 * @return
	 */
	@RequestMapping(value="{instanceId}/status")
	@ResponseBody
	private AjaxResponse getInstanceStatue(@PathVariable("instanceId") String processInstanceId ){
		return null;
	}
	
	/**
	 * 流程定义列表,流程的所有发布
	 *
	 * @return
	 */
	@RequestMapping(value = "process-list")
	public AjaxResponse processList(AjaxResponse response) {
		AjaxDataWrap<VOProcessDefinition> dataWrap = new AjaxDataWrap<VOProcessDefinition>();
		List<VOProcessDefinition> processDefinitionList = new ArrayList<VOProcessDefinition>();
		List<ProcessDefinition> source = repositoryService.createProcessDefinitionQuery().orderByDeploymentId().desc()
				.list();
		processDefinitionList = CommonBeanUtils.copyTo(source, VOProcessDefinition.class);
		response.setViewName("/process/processList.html");
		dataWrap.setDataList(processDefinitionList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	/**
	 * 传递任务
	 * 
	 * @param instanceId
	 * @return
	 */
	@RequestMapping(value = "{instanceId}/transmit", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String transmit(@PathVariable("instanceId") String instanceId) {
		try {
			
			String taskId = taskService.createTaskQuery().processInstanceId(instanceId).singleResult().getId();
			taskService.complete(taskId);
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}
	

	/**
	 * 回退任务
	 * 
	 * @param instanceId
	 * @return
	 */
	@RequestMapping(value = "{instanceId}/rollback", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String backup(@PathVariable("instanceId") String instanceId) {
		try {
			String taskId = taskService.createTaskQuery().processInstanceId(instanceId).singleResult().getId();
			ActivitiUtil.TaskRollBack(taskId);
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}
	
	/**
	 * 读取资源，通过流程ID
	 *
	 * @param resourceType
	 *            资源类型(xml|image)
	 * @param deployId
	 *            流程实例ID
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/svg")
	public void loadByDeployId(@RequestParam("type") String resourceType, @RequestParam("pdId") String pdId,
			HttpServletResponse response) throws Exception {
		InputStream resourceAsStream = null;
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(pdId)
				.singleResult();

		String resourceName = "";
		if (resourceType.equals("image")) {
			resourceName = processDefinition.getDiagramResourceName();
		} else if (resourceType.equals("xml")) {
			resourceName = processDefinition.getResourceName();
		}
		resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
		byte[] b = new byte[1024];
		int len = -1;
		while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
	}

	@Autowired
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	@Autowired
	public void setRepositoryService(RepositoryService repositoryService) {
		this.repositoryService = repositoryService;
	}
	
}