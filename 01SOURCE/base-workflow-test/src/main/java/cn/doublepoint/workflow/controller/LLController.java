/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月30日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.controller;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.impl.pvm.process.ProcessDefinitionImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.filter.BodyReaderHttpServletRequestWrapper;
import cn.doublepoint.commonutil.log.Log4jUtil;
import cn.doublepoint.template.dto.domain.model.entity.workflow.VOModel;
import cn.doublepoint.template.dto.domain.model.entity.workflow.VOProcessDefinition;

@Controller
@RequestMapping(value = "/template/sys/workflow")
public class LLController {

	@Autowired
	protected RepositoryService repositoryService;
	@Autowired
	protected RuntimeService runtimeService;
	@Autowired
	protected TaskService taskService;

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
		response.setViewName("/sys/workflow/processList");
		dataWrap.setDataList(processDefinitionList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	/**
	 * 模型列表
	 */
	@RequestMapping(value = "model-list")
	public AjaxResponse modelList(AjaxResponse response) {
		AjaxDataWrap<VOModel> dataWrap = new AjaxDataWrap<VOModel>();
		List<VOModel> resultList = new ArrayList<VOModel>();
		List<Model> list = repositoryService.createModelQuery().list();
		resultList = CommonBeanUtils.copyTo(list, VOModel.class);
		response.setViewName("/sys/workflow/modelList");
		dataWrap.setDataList(resultList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	/**
	 * 模型列表
	 */
	@RequestMapping(value = "model-retrieve")
	@ResponseBody
	public AjaxResponse retrieveModel(AjaxResponse response) {
		AjaxDataWrap<VOModel> dataWrap = new AjaxDataWrap<VOModel>();
		List<VOModel> resultList = new ArrayList<VOModel>();
		List<Model> list = repositoryService.createModelQuery().list();
		resultList = CommonBeanUtils.copyTo(list, VOModel.class);
		dataWrap.setDataList(resultList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	@RequestMapping(value = "model-add")
	public AjaxResponse modelAdd(AjaxResponse response) {
		response.setViewName("/sys/workflow/modelDialog");
		return response;
	}

	@RequestMapping(value = "model-delete")
	@ResponseBody
	public AjaxResponse modelDelete(BodyReaderHttpServletRequestWrapper request) {
		AjaxDataWrap<VOModel> dataWrap = request.getAjaxDataWrap("dataWrap", VOModel.class);
		List<VOModel> deleteList = dataWrap.getDataList();
		if (deleteList != null && deleteList.size() > 0) {
			deleteList.stream().forEach(item -> repositoryService.deleteModel(item.getId()));
		}
		AjaxResponse response = new AjaxResponse();
		response.setAjaxParameter("deleteState", true);
		return response;
	}

	/**
	 * 创建模型
	 */
	@RequestMapping(value = "model-create")
	@ResponseBody
	public AjaxResponse modelCreate(@RequestParam("name") String name, @RequestParam("key") String key,
			@RequestParam("description") String description, HttpServletRequest request, HttpServletResponse response) {

		ObjectMapper objectMapper = new ObjectMapper();
		ObjectNode editorNode = objectMapper.createObjectNode();
		editorNode.put("id", "canvas");
		editorNode.put("resourceId", "canvas");
		ObjectNode stencilSetNode = objectMapper.createObjectNode();
		stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
		editorNode.put("stencilset", stencilSetNode);
		Model modelData = repositoryService.newModel();

		ObjectNode modelObjectNode = objectMapper.createObjectNode();
		modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
		modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
		description = StringUtils.defaultString(description);
		modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
		modelData.setMetaInfo(modelObjectNode.toString());
		modelData.setName(name);
		modelData.setKey(StringUtils.defaultString(key));

		repositoryService.saveModel(modelData);
		try {
			repositoryService.addModelEditorSource(modelData.getId(), editorNode.toString().getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			Log4jUtil.error(e);
			AjaxResponse ajaxResponse = new AjaxResponse();
			ajaxResponse.setErrorMessage("创建失败。");
			return ajaxResponse;
		}

		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setAjaxParameter("modelId", modelData.getId());
		return ajaxResponse;

	}

	/**
	 * 根据Model部署流程
	 */
	@RequestMapping(value = "model/deploy/{modelId}")
	@ResponseBody
	public AjaxResponse modelDeploy(@PathVariable("modelId") String modelId, RedirectAttributes redirectAttributes) {
		AjaxResponse response = new AjaxResponse();
		try {
			Model modelData = repositoryService.getModel(modelId);
			ObjectNode modelNode = (ObjectNode) new ObjectMapper()
					.readTree(repositoryService.getModelEditorSource(modelData.getId()));
			byte[] bpmnBytes = null;

			BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);
			bpmnBytes = new BpmnXMLConverter().convertToXML(model);

			String processName = modelData.getName() + ".bpmn20.xml";
			Deployment deployment = repositoryService.createDeployment().name(modelData.getName())
					.addString(processName, new String(bpmnBytes)).deploy();
			response.setAjaxParameter("returnMessage", "部署成功，部署ID=" + deployment.getId());
		} catch (Exception e) {
			Log4jUtil.error(e);
			response.setErrorMessage("部署失败。");
		}
		return response;
	}

	/**
	 * 读取资源，通过流程ID
	 *
	 * @param resourceType
	 *            资源类型(xml|image)
	 * @param processInstanceId
	 *            流程实例ID
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/resource/process-instance")
	public void loadByProcessInstance(@RequestParam("type") String resourceType,
			@RequestParam("pid") String processInstanceId, HttpServletResponse response) throws Exception {
		InputStream resourceAsStream = null;
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
				.processInstanceId(processInstanceId).singleResult();
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
				.processDefinitionId(processInstance.getProcessDefinitionId()).singleResult();

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
	@RequestMapping(value = "/resource/processdefine/image")
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

	/**
	 * 挂起
	 * @param instanceId
	 * @return
	 */
	@RequestMapping("suspend/{instanceId}")
	@ResponseBody
	public String suspend(@PathVariable("instanceId") String instanceId) {
		try {
			repositoryService.suspendProcessDefinitionById(instanceId, true, null);
		} catch (Exception e) {
			return e.toString();
		}
		return "";
	}
	 /**
     * 完成任务
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "transmit/{instanceId}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String transmit(@PathVariable("instanceId") String instanceId) {
        try {
        	String currentActivityId=runtimeService.createExecutionQuery().processInstanceId(instanceId).singleResult().getActivityId();
            taskService.complete(currentActivityId);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
	/**
	 * 废除
	 * @param instanceId
	 * @return
	 */
	@RequestMapping("abolish/{instanceId}")
	@ResponseBody
	public String abolish(@PathVariable("instanceId") String instanceId) {
		try {
			
		} catch (Exception e) {
			return e.toString();
		}
		return "";
	}
	/**
	 * 启动
	 * @param instanceId
	 * @return
	 */
	@RequestMapping("start/{processDefineKey}")
	@ResponseBody
	public String start(@PathVariable("processDefineKey") String processDefineKey) {
		runtimeService.startProcessInstanceByKey(processDefineKey);
		return "";
	}

	/**
	 * 挂起、激活流程实例
	 */
	@RequestMapping(value = "processdefinition/update/{state}/{processDefinitionId}")
	public String updateState(@PathVariable("state") String state,
			@PathVariable("processDefinitionId") String processDefinitionId, RedirectAttributes redirectAttributes) {
		runtimeService.startProcessInstanceById(processDefinitionId);
		if (state.equals("active")) {
			redirectAttributes.addFlashAttribute("message", "已激活ID为[" + processDefinitionId + "]的流程定义。");
			repositoryService.activateProcessDefinitionById(processDefinitionId, true, null);
		} else if (state.equals("suspend")) {
			repositoryService.suspendProcessDefinitionById(processDefinitionId, true, null);
			redirectAttributes.addFlashAttribute("message", "已挂起ID为[" + processDefinitionId + "]的流程定义。");
		}
		return "redirect:/workflow/process-list";
	}
	
	/** 
     * 根据任务ID和节点ID获取活动节点 <br> 
     *  
     * @param taskId 
     *            任务ID 
     * @param activityId 
     *            活动节点ID <br> 
     *            如果为null或""，则默认查询当前活动节点 <br> 
     *            如果为"end"，则查询结束节点 <br> 
     *  
     * @return 
     * @throws Exception 
     */  
    private ActivityImpl findActivitiImpl(String taskId, String activityId)  
            throws Exception {  
        // 取得流程定义  
        ProcessDefinitionEntity processDefinition = findProcessDefinitionEntityByTaskId(taskId);  
  
        // 获取当前活动节点ID  
        if (StringUtil.isNullOrEmpty(activityId)) {  
            activityId = findTaskById(taskId).getTaskDefinitionKey();  
        }  
  
        // 根据流程定义，获取该流程实例的结束节点  
        if (activityId.toUpperCase().equals("END")) {  
            for (ActivityImpl activityImpl : processDefinition.getActivities()) {  
                List<PvmTransition> pvmTransitionList = activityImpl  
                        .getOutgoingTransitions();  
                if (pvmTransitionList.isEmpty()) {  
                    return activityImpl;  
                }  
            }  
        }  
  
        // 根据节点ID，获取对应的活动节点  
        ActivityImpl activityImpl = ((ProcessDefinitionImpl) processDefinition)  
                .findActivity(activityId);  
  
        return activityImpl;  
    }  
    
    /** 
     * 根据任务ID获得任务实例 
     *  
     * @param taskId 
     *            任务ID 
     * @return 
     * @throws Exception 
     */  
    private TaskEntity findTaskById(String taskId) throws Exception {  
        TaskEntity task = (TaskEntity) taskService.createTaskQuery().taskId(  
                taskId).singleResult();  
        if (task == null) {  
            throw new Exception("任务实例未找到!");  
        }  
        return task;  
    }  
    
    /** 
     * 根据任务ID获取流程定义 
     *  
     * @param taskId 
     *            任务ID 
     * @return 
     * @throws Exception 
     */  
    private ProcessDefinitionEntity findProcessDefinitionEntityByTaskId(  
            String taskId) throws Exception {  
        // 取得流程定义  
        ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)  
                .getDeployedProcessDefinition(findTaskById(taskId)  
                        .getProcessDefinitionId());  
  
        if (processDefinition == null) {  
            throw new Exception("流程定义未找到!");  
        }  
  
        return processDefinition;  
    }  
}
