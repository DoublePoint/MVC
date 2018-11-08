///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2018年5月30日
//* 
//* 类   说   明 ：
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package cn.doublepoint.workflow.controller;
//
//import java.io.InputStream;
//import java.io.UnsupportedEncodingException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.activiti.bpmn.converter.BpmnXMLConverter;
//import org.activiti.bpmn.model.BpmnModel;
//import org.activiti.editor.constants.ModelDataJsonConstants;
//import org.activiti.editor.language.json.converter.BpmnJsonConverter;
//import org.activiti.engine.RepositoryService;
//import org.activiti.engine.RuntimeService;
//import org.activiti.engine.TaskService;
//import org.activiti.engine.impl.RepositoryServiceImpl;
//import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
//import org.activiti.engine.impl.persistence.entity.TaskEntity;
//import org.activiti.engine.impl.pvm.PvmTransition;
//import org.activiti.engine.impl.pvm.process.ActivityImpl;
//import org.activiti.engine.impl.pvm.process.ProcessDefinitionImpl;
//import org.activiti.engine.repository.Deployment;
//import org.activiti.engine.repository.Model;
//import org.activiti.engine.repository.ProcessDefinition;
//import org.activiti.engine.runtime.ProcessInstance;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.node.ObjectNode;
//
//import cn.doublepoint.commonutil.StringUtil;
//import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
//import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
//import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
//import cn.doublepoint.commonutil.log.Log4jUtil;
//import cn.doublepoint.workflow.process.VOModel;
//import cn.doublepoint.workflow.process.VOProcessDefinition;
//
//@Controller
//@RequestMapping(value = "/process")
//public class LLController {
//
//	@Autowired
//	protected RepositoryService repositoryService;
//	@Autowired
//	protected RuntimeService runtimeService;
//	@Autowired
//	protected TaskService taskService;
//
//	/**
//	 * 流程定义列表,流程的所有发布
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "process-list")
//	public AjaxResponse processList(AjaxResponse response) {
//		AjaxDataWrap<VOProcessDefinition> dataWrap = new AjaxDataWrap<VOProcessDefinition>();
//		List<VOProcessDefinition> processDefinitionList = new ArrayList<VOProcessDefinition>();
//		List<ProcessDefinition> source = repositoryService.createProcessDefinitionQuery().orderByDeploymentId().desc()
//				.list();
//		processDefinitionList = CommonBeanUtils.copyTo(source, VOProcessDefinition.class);
//		response.setViewName("/process/processList.html");
//		dataWrap.setDataList(processDefinitionList);
//		response.setAjaxParameter("dataWrap", dataWrap);
//		return response;
//	}
//
//	
//
//	/**
//	 * 读取资源，通过流程ID
//	 *
//	 * @param resourceType
//	 *            资源类型(xml|image)
//	 * @param processInstanceId
//	 *            流程实例ID
//	 * @param response
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/resource/process-instance")
//	public void loadByProcessInstance(@RequestParam("type") String resourceType,
//			@RequestParam("pid") String processInstanceId, HttpServletResponse response) throws Exception {
//		InputStream resourceAsStream = null;
//		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
//				.processInstanceId(processInstanceId).singleResult();
//		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
//				.processDefinitionId(processInstance.getProcessDefinitionId()).singleResult();
//
//		String resourceName = "";
//		if (resourceType.equals("image")) {
//			resourceName = processDefinition.getDiagramResourceName();
//		} else if (resourceType.equals("xml")) {
//			resourceName = processDefinition.getResourceName();
//		}
//		resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
//		byte[] b = new byte[1024];
//		int len = -1;
//		while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
//			response.getOutputStream().write(b, 0, len);
//		}
//	}
//
//	/**
//	 * 读取资源，通过流程ID
//	 *
//	 * @param resourceType
//	 *            资源类型(xml|image)
//	 * @param deployId
//	 *            流程实例ID
//	 * @param response
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/resource/processdefine/image")
//	public void loadByDeployId(@RequestParam("type") String resourceType, @RequestParam("pdId") String pdId,
//			HttpServletResponse response) throws Exception {
//		InputStream resourceAsStream = null;
//		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(pdId)
//				.singleResult();
//
//		String resourceName = "";
//		if (resourceType.equals("image")) {
//			resourceName = processDefinition.getDiagramResourceName();
//		} else if (resourceType.equals("xml")) {
//			resourceName = processDefinition.getResourceName();
//		}
//		resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
//		byte[] b = new byte[1024];
//		int len = -1;
//		while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
//			response.getOutputStream().write(b, 0, len);
//		}
//	}
//
//	/**
//	 * 挂起
//	 * @param instanceId
//	 * @return
//	 */
//	@RequestMapping("suspend/{instanceId}")
//	@ResponseBody
//	public String suspend(@PathVariable("instanceId") String instanceId) {
//		try {
//			repositoryService.suspendProcessDefinitionById(instanceId, true, null);
//		} catch (Exception e) {
//			return e.toString();
//		}
//		return "";
//	}
//	 
//	/**
//	 * 废除
//	 * @param instanceId
//	 * @return
//	 */
//	@RequestMapping("abolish/{instanceId}")
//	@ResponseBody
//	public String abolish(@PathVariable("instanceId") String instanceId) {
//		try {
//			
//		} catch (Exception e) {
//			return e.toString();
//		}
//		return "";
//	}
////	/**
////	 * 启动
////	 * @param instanceId
////	 * @return
////	 */
////	@RequestMapping("start/{processDefineKey}")
////	@ResponseBody
////	public long start(@PathVariable("processDefineKey") String processDefineKey) {
////		ProcessInstance pInstance=runtimeService.startProcessInstanceByKey(processDefineKey);
////		return Long.valueOf(pInstance.getProcessInstanceId());
////	}
//
//	/**
//	 * 挂起、激活流程实例
//	 */
//	@RequestMapping(value = "processdefinition/update/{state}/{processDefinitionId}")
//	public String updateState(@PathVariable("state") String state,
//			@PathVariable("processDefinitionId") String processDefinitionId, RedirectAttributes redirectAttributes) {
//		runtimeService.startProcessInstanceById(processDefinitionId);
//		if (state.equals("active")) {
//			redirectAttributes.addFlashAttribute("message", "已激活ID为[" + processDefinitionId + "]的流程定义。");
//			repositoryService.activateProcessDefinitionById(processDefinitionId, true, null);
//		} else if (state.equals("suspend")) {
//			repositoryService.suspendProcessDefinitionById(processDefinitionId, true, null);
//			redirectAttributes.addFlashAttribute("message", "已挂起ID为[" + processDefinitionId + "]的流程定义。");
//		}
//		return "redirect:/workflow/process-list";
//	}
//	
//	/** 
//     * 根据任务ID和节点ID获取活动节点 <br> 
//     *  
//     * @param taskId 
//     *            任务ID 
//     * @param activityId 
//     *            活动节点ID <br> 
//     *            如果为null或""，则默认查询当前活动节点 <br> 
//     *            如果为"end"，则查询结束节点 <br> 
//     *  
//     * @return 
//     * @throws Exception 
//     */  
//    private ActivityImpl findActivitiImpl(String taskId, String activityId)  
//            throws Exception {  
//        // 取得流程定义  
//        ProcessDefinitionEntity processDefinition = findProcessDefinitionEntityByTaskId(taskId);  
//  
//        // 获取当前活动节点ID  
//        if (StringUtil.isNullOrEmpty(activityId)) {  
//            activityId = findTaskById(taskId).getTaskDefinitionKey();  
//        }  
//  
//        // 根据流程定义，获取该流程实例的结束节点  
//        if (activityId.toUpperCase().equals("END")) {  
//            for (ActivityImpl activityImpl : processDefinition.getActivities()) {  
//                List<PvmTransition> pvmTransitionList = activityImpl  
//                        .getOutgoingTransitions();  
//                if (pvmTransitionList.isEmpty()) {  
//                    return activityImpl;  
//                }  
//            }  
//        }  
//  
//        // 根据节点ID，获取对应的活动节点  
//        ActivityImpl activityImpl = ((ProcessDefinitionImpl) processDefinition)  
//                .findActivity(activityId);  
//  
//        return activityImpl;  
//    }  
//    
//    /** 
//     * 根据任务ID获得任务实例 
//     *  
//     * @param taskId 
//     *            任务ID 
//     * @return 
//     * @throws Exception 
//     */  
//    private TaskEntity findTaskById(String taskId) throws Exception {  
//        TaskEntity task = (TaskEntity) taskService.createTaskQuery().taskId(  
//                taskId).singleResult();  
//        if (task == null) {  
//            throw new Exception("任务实例未找到!");  
//        }  
//        return task;  
//    }  
//    
//    /** 
//     * 根据任务ID获取流程定义 
//     *  
//     * @param taskId 
//     *            任务ID 
//     * @return 
//     * @throws Exception 
//     */  
//    private ProcessDefinitionEntity findProcessDefinitionEntityByTaskId(  
//            String taskId) throws Exception {  
//        // 取得流程定义  
//        ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)  
//                .getDeployedProcessDefinition(findTaskById(taskId)  
//                        .getProcessDefinitionId());  
//  
//        if (processDefinition == null) {  
//            throw new Exception("流程定义未找到!");  
//        }  
//  
//        return processDefinition;  
//    }  
//}
