/**
 * 
 */
/**
 * @author Administrator
 *
 */
package cn.doublepoint.common.port.adapter.template.persistence.sys.common;

import static java.util.stream.Collectors.toList;

import java.sql.DatabaseMetaData;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.doublepoint.commonutil.domain.model.DropBean;

public class DropBeanUtil{
	
	private static JdbcTemplate jdbcTemplate;
	
	@PostConstruct
	public void setUp(){
		
	}

	public DropBeanUtil() {
		jdbcTemplate=(JdbcTemplate)ApplicationContectUtil.getBean("jdbcTemplate");
	}
	
	public static List<DropBean> getDropListBySql(String sql){
		try {
			String dataBaseName=DataBaseMetaDataUtil.getDataBaseName();
			sql="select table_name as 'key',table_name  as 'value','' filter from information_schema.tables  WHERE TABLE_SCHEMA = '"+dataBaseName+"'";
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