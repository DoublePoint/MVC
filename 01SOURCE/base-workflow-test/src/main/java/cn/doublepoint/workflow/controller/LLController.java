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

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.workflow.domain.model.entity.VOProcessDefinition;

@Controller
@RequestMapping(value = "/template/sys/workflow")
public class LLController {
	
	 @Autowired
	 protected RepositoryService repositoryService;
	
	/**
     * 流程定义列表
     *
     * @return
     */
    @RequestMapping(value = "process-list")
    public AjaxResponse processList(AjaxResponse response) {
    	
    	AjaxDataWrap<VOProcessDefinition> dataWrap=new AjaxDataWrap<VOProcessDefinition>();
    	List<VOProcessDefinition> processDefinitionList=new ArrayList<VOProcessDefinition>();
    	List<ProcessDefinition> source = repositoryService.createProcessDefinitionQuery().orderByDeploymentId().desc().list();
    	processDefinitionList=CommonBeanUtils.copyTo(source, VOProcessDefinition.class);
        response.setViewName("/sys/workflow/processList");
        dataWrap.setDataList(processDefinitionList);
        response.setAjaxParameter("dataWrap", dataWrap);
        return response;
    }
}
