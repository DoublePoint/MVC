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

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import cn.doublepoint.common.domain.model.entity.sys.MySQLTables;

public class DataBaseMetaDataUtil {
	private static JdbcTemplate jdbcTemplate;
	private static Map<String, String> map;

	static {
		jdbcTemplate = (JdbcTemplate) ApplicationContectUtil.getBean("jdbcTemplate");
		map=new HashMap<String, String>();
	}

	/**
	 * 获取数据库名称
	 * @return
	 * @throws SQLException
	 */
	public static String getDataBaseName() throws SQLException{
		if(map.get("databaseName")==null){
			Properties prop = new Properties();  
			try {
				prop.load(DataBaseMetaDataUtil.class.getResourceAsStream("/jdbc.properties"));
			} catch (IOException e) {
				e.printStackTrace();
			}  
			String jdbcName=(String) prop.get("jdbc.databsename");
			return jdbcName;
		}
		else
			return map.get("databaseName").toString();
	}
	
	/**
	 * 获得当前数据库中所有表的相关数据
	 * @param <E>
	 * @return
	 * @throws SQLException
	 */
	@Transactional
	public static <E> List<MySQLTables> getTables() {
		try {
			jdbcTemplate.setQueryTimeout(30);
			String dataBaseName=DataBaseMetaDataUtil.getDataBaseName();
			String sql="select  table_name as 'key',table_name  as 'value','' filter  from information_schema.tables  WHERE TABLE_SCHEMA = '"+dataBaseName+"'";
			List<Map<String, Object>> mapList=jdbcTemplate.queryForList(sql);
			List<MySQLTables> list=mapList.stream().map(m->{
				String aKey=(String) m.get("key");
				String aValue=(String) m.get("value");
				String aFilter=(String)m.getOrDefault("filter", "");
				MySQLTables dropBean=new MySQLTables();
				dropBean.setTableName(aKey);
				return dropBean;
			}).collect(toList());
			
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		
	}
}
