/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.application.template.sys.woksheet;

import cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet.InstanceService;
import cn.doublepoint.commonutil.ApplicationContextUtil;

public class WorksheetUtil {
	
	/**
	 * 创建工作单
	 * 
	 * @param worksheetType
	 * @param userId
	 * @param remak 
	 * @return worksheetNo
	 */
	public static String createAndStart(String classification, String createUser, String description) {
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

	private static InstanceService getInstanceService() {
		return (InstanceService) ApplicationContextUtil.getBean("instanceService");
	}

}
