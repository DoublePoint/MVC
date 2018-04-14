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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.doublepoint.commonutil.domain.model.DropBean;

public class DropBeanUtil{
	
	
	@Autowired
	private static JdbcTemplate jdbcTemplate;
	
	public static List<DropBean> getDropListBySql(String sql){
		try {
			List<Map<String, Object>> mapList=jdbcTemplate.queryForList(sql);
			
			List<DropBean> list=mapList.stream().map(m->{
				String aKey=(String) m.get("key");
				String aValue=(String) m.get("value");
				DropBean dropBean=new DropBean();
				dropBean.setKey(aKey);
				dropBean.setValue(aValue);
				dropBean.setFilter("");
				return dropBean;
			}).collect(toList());
			
			return list;
		} catch (Exception e) {
			return null;
		}
		
	}
}