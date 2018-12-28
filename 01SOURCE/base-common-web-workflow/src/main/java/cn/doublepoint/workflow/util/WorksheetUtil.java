/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.util;

import java.util.List;

import cn.doublepoint.commonutil.ApplicationContextUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.log.Log4jUtil;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModel;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModelQuery;
import cn.doublepoint.dto.domain.model.vo.workflow.VOTask;
import cn.doublepoint.workflow.config.WorkflowAutoConfig;
import cn.doublepoint.workflow.process.InstanceService;
import cn.doublepoint.workflow.process.ModelService;

public class WorksheetUtil {
	
	private static String workflowUrl;
	
	/**
	 * 创建工作单
	 * 
	 * @param worksheetType
	 * @param userId
	 * @param remak 
	 * @return worksheetNo
	 */
	public static String createAndStart(String classification, Integer createUser, String description) {
		InstanceService instanceService = getInstanceService();
		return instanceService.createAndStart(classification, createUser, description);
	}

	/**
	 * 传递工作单
	 * 
	 * @param instanceId
	 * @return
	 */
	public static void transmit(String instanceId) {
		InstanceService instanceService = getInstanceService();
		instanceService.transmit(instanceId);
	}

	/**
	 * 回退工作单
	 * 
	 * @param worksheetType
	 * @return
	 */
	public static void back(String instanceId) {
		InstanceService instanceService = getInstanceService();
		instanceService.back(instanceId);
	}

	/**
	 * 作废工作单
	 * 
	 * @param worksheetType
	 * @return
	 */
	public static void abolish(String instanceId) {
		InstanceService instanceService = getInstanceService();
		instanceService.abolish(instanceId);
	}

	/**
	 * 挂起工作单
	 * 
	 * @param worksheetType
	 * @return
	 */
	public static void suspend(String instanceId) {
		InstanceService instanceService = getInstanceService();
		instanceService.suspend(instanceId);
	}

	/**
	 * 工作单挂起之后若需要激活，调用此方法
	 * 
	 * @param worksheetType
	 * @return
	 */
	public static void active(String instanceId) {
		InstanceService instanceService = getInstanceService();
		instanceService.active(instanceId);
	}
	
	/**
	 * 获取实例历史记录
	 * @param instanceId
	 * @return
	 */
	public static List<VOTask> getHistoricTasks(String instanceId){
		InstanceService instanceService = getInstanceService();
		return instanceService.getHistoricTasks(instanceId);
	}

	/**
	 * 查询Model
	 * @param query
	 * @return
	 */
	public static AjaxDataWrap<VOActReModel> retrieveModel(VOActReModelQuery query){
		ModelService modelService = getModelService();
		return modelService.retrieve(query);
	}
	
	private static InstanceService getInstanceService() {
		return (InstanceService) ApplicationContextUtil.getBean("instanceService");
	}
	
	private static ModelService getModelService() {
		return (ModelService) ApplicationContextUtil.getBean("llModelService");
	}

	public static String getWorkflowUrl() {
		if (cn.doublepoint.commonutil.StringUtil.isNullOrEmpty(workflowUrl)) {
			try{
				WorkflowAutoConfig workflowAutoConfig=(WorkflowAutoConfig)ApplicationContextUtil.getBean("workflowAutoConfig");
				return workflowAutoConfig.getUrl();
			}catch(Exception e){
				Log4jUtil.error(e);
			}
		}
		return workflowUrl;
	}

	public void setWorkflowUrl(String workflowUrl) {
		WorksheetUtil.workflowUrl = workflowUrl;
	}

}
