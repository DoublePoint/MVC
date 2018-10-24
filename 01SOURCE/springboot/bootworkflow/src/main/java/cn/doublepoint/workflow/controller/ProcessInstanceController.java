package cn.doublepoint.workflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
//import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;

/**
 * 流程管理控制器
 *
 * @author HenryYan
 */
@Controller
@RequestMapping(value = "/workflow/instance")
public class ProcessInstanceController {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	protected HistoryService historyService;
	protected TaskService taskService;

	/*@Autowired
	ManagementService managementService;*/

	protected static Map<String, ProcessDefinition> PROCESS_DEFINITION_CACHE = new HashMap<String, ProcessDefinition>();

	@Autowired
	ProcessEngineFactoryBean processEngine;

	@Autowired
	ProcessEngineConfiguration processEngineConfiguration;

	/**
	 * 查询历史任务
	 * 
	 * @param response
	 * @param processInstanceId
	 * @return
	 */
	@RequestMapping(value = "{instanceId}/history/task",method={RequestMethod.GET})
	public AjaxResponse historicTasksGet(AjaxResponse response, @PathVariable("instanceId") String processInstanceId) {
		List<HistoricTaskInstance> historicTaskList=this.getHistoricTasks(processInstanceId);
		response.setViewName("/sys/workflow/historicTaskList");
		AjaxDataWrap<HistoricTaskInstance> dataWrap = new AjaxDataWrap<HistoricTaskInstance>();
		dataWrap.setDataList(historicTaskList);
		historicTaskList.stream().forEach(task -> {
			System.out.println("taskId:" + task.getId());
			System.out.println("taskName:" + task.getName());
			System.out.println("processDefinitionId:" + task.getProcessDefinitionId());
			System.out.println("processInstanceId:" + task.getProcessInstanceId());
			System.out.println("assigne:" + task.getAssignee());
			System.out.println("startTime:" + task.getStartTime());
			System.out.println("endTime:" + task.getEndTime());
			System.out.println("duration:" + task.getDurationInMillis());
			System.out.println("--------------------------");
			System.out.println("--------------------------");
		});
		response.setAjaxParameter("dataWrap", dataWrap);
		response.setAjaxParameter("instanceId", processInstanceId);
		return response;
	}
	
	/**
	 * 获取历史任务
	 * @param processInstanceId
	 * @return
	 */
	@RequestMapping(value = "{instanceId}/history/task",method={RequestMethod.POST})
	@ResponseBody
	private AjaxResponse historicTasksPost(AjaxResponse response, @PathVariable("instanceId") String processInstanceId){
		List<HistoricTaskInstance> historicTaskList=this.getHistoricTasks(processInstanceId);
		AjaxDataWrap<HistoricTaskInstance> dataWrap = new AjaxDataWrap<HistoricTaskInstance>();
		dataWrap.setDataList(historicTaskList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}
	

	private List<HistoricTaskInstance> getHistoricTasks(String processInstanceId){
		List<HistoricTaskInstance> historicTaskList = historyService.createHistoricTaskInstanceQuery()// 创建历史任务的查询
				.processInstanceId(processInstanceId)// 使用流程实例Id查询
				.orderByTaskCreateTime()// 根据创建时间查询
				.asc()// 按照活动开始时间排序
				.list();
		return historicTaskList;
	}

	/**
	 * 传递任务
	 * 
	 * @param instanceId
	 * @return
	 */
	@RequestMapping(value = "transmit/{instanceId}", method = { RequestMethod.POST, RequestMethod.GET })
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
	@RequestMapping(value = "rollback/{instanceId}", method = { RequestMethod.POST, RequestMethod.GET })
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

	@Autowired
	public void setHistoryService(HistoryService historyService) {
		this.historyService = historyService;
	}

	@Autowired
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	
	
}