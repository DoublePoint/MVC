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

import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;

public class DataBaseMetaDataUtil {
	private static JdbcTemplate jdbcTemplate;

	public DataBaseMetaDataUtil() {
		jdbcTemplate = (JdbcTemplate) ApplicationContectUtil.getBean("jdbcTemplate");
	}

	public static String getDataBaseName() throws SQLException{
		jdbcTemplate = (JdbcTemplate) ApplicationContectUtil.getBean("jdbcTemplate");
		DatabaseMetaData md = jdbcTemplate.getDataSource().getConnection().getMetaData();
		String url=md.getURL();
		int end=url.indexOf("?");
		int start=url.lastIndexOf("/");
		String dataBaseName=url.substring(start+1, end);
		return dataBaseName;
	}
}
