package cn.doublepoint.workflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
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
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 流程管理控制器
 *
 * @author HenryYan
 */
@Controller
@RequestMapping(value = "/workflow/instance")
public class InstanceController {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    protected RepositoryService repositoryService;
    protected RuntimeService runtimeService;
    protected TaskService taskService;
    protected HistoryService historyService;

    @Autowired
    ManagementService managementService;

    protected static Map<String, ProcessDefinition> PROCESS_DEFINITION_CACHE = new HashMap<String, ProcessDefinition>();

    @Autowired
    ProcessEngineFactoryBean processEngine;

    @Autowired
    ProcessEngineConfiguration processEngineConfiguration;

    @RequestMapping(value = "{instanceId}/history/task")
    @ResponseBody
    public void queryBpmnModel(@PathVariable("instanceId") String processInstanceId) {
    	List<HistoricTaskInstance> historicTaskList=
    			historyService.createHistoricTaskInstanceQuery()//创建历史任务的查询
    			.processInstanceId(processInstanceId)//使用流程实例Id查询
    			.orderByHistoricTaskInstanceStartTime()
    			.asc()//按照活动开始时间排序
    			.list();
	      historicTaskList.stream().forEach(task->{
	    	  System.out.println("taskId:"+task.getId());
	    	  System.out.println("taskName:"+task.getName());
	    	  System.out.println("processDefinitionId:"+task.getProcessDefinitionId());
	    	  System.out.println("processInstanceId:"+task.getProcessInstanceId());
	    	  System.out.println("assigne:"+task.getAssignee());
	    	  System.out.println("startTime:"+task.getStartTime());
	    	  System.out.println("endTime:"+task.getEndTime());
	    	  System.out.println("duration:"+task.getDurationInMillis());
	    	  System.out.println("--------------------------");
	      });
    }

    @Autowired
    public void setRepositoryService(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    @Autowired
    public void setRuntimeService(RuntimeService runtimeService) {
        this.runtimeService = runtimeService;
    }

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @Autowired
    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }
}