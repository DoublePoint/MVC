package cn.doublepoint.workflow.controller;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.dto.domain.model.vo.workflow.VOTask;

/**
 * 流程管理控制器
 *
 * @author HenryYan
 */
@Controller
@RequestMapping(value = "oll/task")
public class TaskInstanceController {

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
    
    @RequestMapping(value = "/{taskId}")
    @ResponseBody
    public AjaxResponse queryBpmnModel(AjaxResponse response,@PathVariable("taskId") String taskId) {
    	Task task=taskService.createTaskQuery()
    			.taskId(taskId)
    			.singleResult();
    	AjaxDataWrap<VOTask> dataWrap=new AjaxDataWrap<VOTask>();
    	VOTask resultTask=new VOTask();
    	CommonBeanUtils.copyProperties(task, resultTask);
    	dataWrap.setData(resultTask);
    	response.setAjaxParameter("dataWrap", dataWrap);
    	return response;
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