/**
 * 
 */
/**
 * @author Administrator
 *
 */
package cn.doublepoint.common.util;

import java.util.List;

import cn.doublepoint.common.application.template.sys.droplist.CommonDropBeanListService;
import cn.doublepoint.commonutil.ApplicationContextUtil;
import cn.doublepoint.commonutil.ajaxmodel.DropBean;

public class DropBeanUtil {
	
	public static List<DropBean> findDropList(String dropName) {
		return getCommonDropBeanListService().findDropList(dropName);
	}
	
	public static CommonDropBeanListService getCommonDropBeanListService() {
		CommonDropBeanListService service = (CommonDropBeanListService) ApplicationContextUtil.getBean("commonDropBeanListService");
		return service;
	}
}