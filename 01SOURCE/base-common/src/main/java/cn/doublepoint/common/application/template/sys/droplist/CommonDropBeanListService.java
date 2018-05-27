package cn.doublepoint.common.application.template.sys.droplist;
import java.util.List;

import cn.doublepoint.commonutil.ajaxmodel.DropBean;


public interface CommonDropBeanListService {

	/**
	 * 根据下拉名称查询下拉
	 * @param dropName
	 * @return
	 */
	public List<DropBean> findDropList(String dropName);

}