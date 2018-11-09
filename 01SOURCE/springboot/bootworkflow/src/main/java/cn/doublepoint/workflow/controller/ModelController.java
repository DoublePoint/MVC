package cn.doublepoint.workflow.controller;

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
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.log.Log4jUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.WorkflowModelRequest;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModel;
import cn.doublepoint.workflow.service.ModelService;

/**
 * 流程模型控制器
 *
 * @author liulei
 */
@Controller
public class ModelController {

	
	@Autowired
	protected RepositoryService repositoryService;
	@Autowired
	protected ModelService modelService;
	
	/**
	 * 模型列表
	 */
	@RequestMapping(value = "oll/model/model-list")
	public AjaxResponse modelList(AjaxResponse response) {
		AjaxDataWrap<VOActReModel> dataWrap = new AjaxDataWrap<VOActReModel>();
		List<VOActReModel> resultList = new ArrayList<VOActReModel>();
		List<Model> list = repositoryService.createModelQuery().list();
		resultList = CommonBeanUtils.copyTo(list, VOActReModel.class);
		response.setViewName("/model/modelList.html");
		dataWrap.setDataList(resultList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}

	/**
	 * 模型列表
	 *//*
	@RequestMapping(value = "model-retrieve")
	@ResponseBody
	public AjaxResponse retrieveModel(AjaxResponse response) {
		AjaxDataWrap<VOActReModel> dataWrap = new AjaxDataWrap<VOActReModel>();
		List<VOActReModel> resultList = new ArrayList<VOActReModel>();
		List<Model> list = repositoryService.createModelQuery().list();
		resultList = CommonBeanUtils.copyTo(list, VOActReModel.class);
		dataWrap.setDataList(resultList);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}*/
	
	/**
	 * 模型列表
	 */
	@RequestMapping(value = "/oll/model/model-retrieve")
	@ResponseBody
	public AjaxResponse retrieveModel(AjaxResponse response,@RequestBody WorkflowModelRequest workflowModelRequest) {
		List<VOActReModel> list=modelService.retrieve(workflowModelRequest);
		AjaxDataWrap<VOActReModel> dataWrap= new AjaxDataWrap<>();
		dataWrap.setDataList(list);
		response.setAjaxParameter("dataWrap", dataWrap);
		return response;
	}
	
	@RequestMapping(value = "oll/model/model-add")
	public AjaxResponse modelAdd(AjaxResponse response) {
		response.setViewName("/model/modelDialog.html");
		return response;
	}

	/*@RequestMapping(value = "model-delete")
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
	}*/

	/**
	 * 创建模型
	 */
	@RequestMapping(value = "oll/model/model-create")
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
	@RequestMapping(value = "oll/model/model/deploy/{modelId}")
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

}
