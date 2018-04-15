/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys.common;

import static java.util.stream.Collectors.toList;

import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cn.doublepoint.common.domain.model.entity.sys.MySQLTables;
import cn.doublepoint.commonutil.domain.model.DropBean;

public class DataBaseMetaDataUtil {
	private static JdbcTemplate jdbcTemplate;

	static {
		jdbcTemplate = (JdbcTemplate) ApplicationContectUtil.getBean("jdbcTemplate");
	}

	/**
	 * 获取数据库名称
	 * @return
	 * @throws SQLException
	 */
	public static String getDataBaseName() throws SQLException{
		DatabaseMetaData md = jdbcTemplate.getDataSource().getConnection().getMetaData();
		String url=md.getURL();
		int end=url.indexOf("?");
		int start=url.lastIndexOf("/");
		String dataBaseName=url.substring(start+1, end);
		return dataBaseName;
	}
	
	/**
	 * 获得当前数据库中所有表的相关数据
	 * @param <E>
	 * @return
	 * @throws SQLException
	 */
	public static <E> List<MySQLTables> getTables() {
		try {
			String dataBaseName=DataBaseMetaDataUtil.getDataBaseName();
			String sql="select  table_name as 'key',table_name  as 'value','' filter  from information_schema.tables  WHERE TABLE_SCHEMA = '"+dataBaseName+"'";
			List<Map<String, Object>> mapList=jdbcTemplate.queryForList(sql);
			List<MySQLTables> list=mapList.stream().map(m->{
				String aKey=(String) m.get("key");
				String aValue=(String) m.get("value");
				String aFilter=(String)m.getOrDefault("filter", "");
				MySQLTables dropBean=new MySQLTables();
				dropBean.setTABLE_NAME(aKey);
				//dropBean.setValue(aValue);
				//dropBean.setFilter(aFilter);
				return dropBean;
			}).collect(toList());
			
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		
//		List<DropBean> list=mapList.stream().map(m->{
//			MySQLTables.class.getDeclaredFields()
//			String aKey=(String) m.get("key");
//			String aValue=(String) m.get("value");
//			String aFilter=(String)m.getOrDefault("filter", "");
//			DropBean dropBean=new DropBean();
//			dropBean.setKey(aKey);
//			dropBean.setValue(aValue);
//			dropBean.setFilter(aFilter);
//			return dropBean;
//		}).collect(toList());
//		
//		return list;
	}
}
