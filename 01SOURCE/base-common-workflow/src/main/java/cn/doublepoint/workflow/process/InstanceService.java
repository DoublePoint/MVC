/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月7日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.process;

import java.util.List;

import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet;

public interface InstanceService {

	/**
	 * 创建并启动工作流程
	 * 
	 * @param classification
	 * @param createUser
	 * @param description
	 * @return
	 */
	public String createAndStart(String classification, String createUser, String description);

	/**
	 * 传递工作单
	 * 
	 * @param worksheetNo
	 * @return
	 */

	public void transmit(String worksheetNo);

	/**
	 * 回退工作单
	 * 
	 * @param worksheetType
	 * @return
	 */

	public void back(String worksheetNo);

	/**
	 * 作废工作单
	 * 
	 * @param worksheetType
	 * @return
	 */

	public void abolish(String worksheetNo);

	/**
	 * 挂起工作单
	 * 
	 * @param worksheetType
	 * @return
	 */

	public void suspend(String worksheetNo);

	/**
	 * 工作单挂起之后若需要激活，调用此方法
	 * 
	 * @param worksheetType
	 * @return
	 */

	public void active(String worksheetType);

	/**
	 * 生成工作单编号
	 * 
	 * @return
	 */
	public String generateWorksheetNo();
	
	/**
	 * 获取待办流程
	 */
	public List<Worksheet> getPersonalWorksheetList(Worksheet worksheet,PageInfo pageInfo);
	
	/**
	 * 获取历史任务
	 * @param instanceId
	 * @return
	 */
	public List<VOTask> getHistoricTasks(String instanceId);
}
