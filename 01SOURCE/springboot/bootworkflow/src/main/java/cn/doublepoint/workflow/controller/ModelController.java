/*package cn.doublepoint.workflow.controller;

import java.io.ByteArrayInputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

*//**
 * 流程模型控制器
 *
 * @author liulei
 *//*
@Controller
@RequestMapping(value = "/workflow/model")
public class ModelController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	RepositoryService repositoryService;

	*//**
	 * 模型列表
	 *//*
	@RequestMapping(value = "list")
	public ModelAndView modelList() {
		ModelAndView mav = new ModelAndView("workflow/model-list");
		List<Model> list = repositoryService.createModelQuery().list();
		mav.addObject("list", list);
		return mav;
	}

	*//**
	 * 导出model对象为指定类型
	 *
	 * @param modelId
	 *            模型ID
	 * @param type
	 *            导出文件类型(bpmn\json)
	 *//*
	@RequestMapping(value = "export/{modelId}/{type}")
	public void export(@PathVariable("modelId") String modelId, @PathVariable("type") String type,
			HttpServletResponse response) {
		try {
			Model modelData = repositoryService.getModel(modelId);
			BpmnJsonConverter jsonConverter = new BpmnJsonConverter();
			byte[] modelEditorSource = repositoryService.getModelEditorSource(modelData.getId());

			JsonNode editorNode = new ObjectMapper().readTree(modelEditorSource);
			BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);

			// 处理异常
			if (bpmnModel.getMainProcess() == null) {
				response.setStatus(HttpStatus.UNPROCESSABLE_ENTITY.value());
				response.getOutputStream().println("no main process, can't export for type: " + type);
				response.flushBuffer();
				return;
			}

			String filename = "";
			byte[] exportBytes = null;

			String mainProcessId = bpmnModel.getMainProcess().getId();

			if (type.equals("bpmn")) {

				BpmnXMLConverter xmlConverter = new BpmnXMLConverter();
				exportBytes = xmlConverter.convertToXML(bpmnModel);

				filename = mainProcessId + ".bpmn20.xml";
			} else if (type.equals("json")) {

				exportBytes = modelEditorSource;
				filename = mainProcessId + ".json";

			}

			ByteArrayInputStream in = new ByteArrayInputStream(exportBytes);
			IOUtils.copy(in, response.getOutputStream());

			response.setHeader("Content-Disposition", "attachment; filename=" + filename);
			response.flushBuffer();
		} catch (Exception e) {
			logger.error("导出model的xml文件失败：modelId={}, type={}", modelId, type, e);
		}
	}

	@RequestMapping(value = "delete/{modelId}")
	public String delete(@PathVariable("modelId") String modelId) {
		repositoryService.deleteModel(modelId);
		return "redirect:/workflow/model/list";
	}

}
*/