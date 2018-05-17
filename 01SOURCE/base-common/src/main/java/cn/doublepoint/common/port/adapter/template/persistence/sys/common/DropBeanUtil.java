/**
 * 
 */
/**
 * @author Administrator
 *
 */
package cn.doublepoint.common.port.adapter.template.persistence.sys.common;

import static java.util.stream.Collectors.toList;

import java.util.List;
import java.util.Map;

import cn.doublepoint.common.port.adapter.template.persistence.sys.DBUtil;
import cn.doublepoint.commonutil.ajaxmodel.DropBean;

public class DropBeanUtil extends DBUtil{
	
	public static List<DropBean> getDropListBySql(String sql){
		try {
			//String dataBaseName=DataBaseMetaDataUtil.getDataBaseName();
			//sql="select table_name as 'key',table_name  as 'value','' filter from information_schema.tables  WHERE TABLE_SCHEMA = '"+dataBaseName+"'";
			sql="select id as 'key',id  as 'value','' filter from menu";
			List<Map<String, Object>> mapList=jdbcTemplate.queryForList(sql);
			List<DropBean> list=mapList.stream().map(m->{
				String aKey=(String) m.get("key");
				String aValue=(String) m.get("value");
				String aFilter=(String)m.getOrDefault("filter", "");
				DropBean dropBean=new DropBean();
				dropBean.setKey(aKey);
				dropBean.setValue(aValue);
				dropBean.setFilter(aFilter);
				return dropBean;
			}).collect(toList());
			
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
}