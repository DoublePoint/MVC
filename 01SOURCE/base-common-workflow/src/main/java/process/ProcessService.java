/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月7日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package process;

import java.util.List;

import cn.doublepoint.template.dto.domain.model.entity.workflow.VOProcessDefinition;

public interface ProcessService {
	
	/**
	 * 获取流程定义
	 * @return
	 */
	public List<VOProcessDefinition> getProcessList();
}
