package cn.doublepoint.workflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.HistoryService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.rest.common.api.DataResponse;
import org.activiti.rest.service.api.history.HistoricTaskInstanceCollectionResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataPacket;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;

/**
 * 流程模型控制器
 *
 * @author liulei
 */
@Controller
@RequestMapping(value = "oll/history")
public class HistoryController {

	/**
	 * 查询历史任务
	 * 
	 * @param response
	 * @param processInstanceId
	 * @return
	 */
	@RequestMapping(value = "{instanceId}/task",method={RequestMethod.GET})
	public AjaxResponse historicTasksGet(AjaxResponse response, @PathVariable("instanceId") String processInstanceId) {
		List<HistoricTaskInstance> historicTaskList=this.getHistoricTasks(processInstanceId);
		response.setViewName("history/historicTaskList.html");
		AjaxDataPacket<HistoricTaskInstance> dataPacket = new AjaxDataPacket<HistoricTaskInstance>();
		dataPacket.setDataList(historicTaskList);
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
		response.setAjaxParameter("dataPacket", dataPacket);
		response.setAjaxParameter("instanceId", processInstanceId);
		return response;
	}
	/**
	 * 查询历史任务
	 * 
	 * @param response
	 * @param processInstanceId
	 * @return
	 */
	@Autowired 
	HistoricTaskInstanceCollectionResource historicTaskInstanceCollectionResource;
	@RequestMapping(value = "{instanceId}/history/task2",method={RequestMethod.GET})
	public AjaxResponse historicTasks(AjaxResponse response, @PathVariable("instanceId") String processInstanceId,HttpServletRequest request) {
		Map<String,String> allRequestParams =new HashMap<>();
		allRequestParams.put("processInstanceId", processInstanceId);
		DataResponse dataResponse=historicTaskInstanceCollectionResource.getHistoricProcessInstances(allRequestParams, request);
		AjaxDataPacket<HistoricTaskInstance> dataPacket = new AjaxDataPacket<HistoricTaskInstance>();
		dataPacket.setDataList((List<HistoricTaskInstance>)dataResponse.getData());
		
		response.setAjaxParameter("dataPacket", dataPacket);
		response.setViewName("sys/workflow/historicTaskList.html");
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
	
	protected HistoryService historyService;
	@Autowired
	public void setHistoryService(HistoryService historyService) {
		this.historyService = historyService;
	}
}
