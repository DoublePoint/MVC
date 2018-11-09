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

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModel;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModelQuery;

public interface ModelService {
	
	/**
	 * 自定义查询模型
	 * @param query
	 * @return
	 */
	public AjaxDataWrap<VOActReModel> retrieve(VOActReModelQuery query);
}
