/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月23日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys;

import javax.annotation.PostConstruct;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.doublepoint.commonutil.ApplicationContextUtil;

public class DBUtil {
	
	public static JdbcTemplate jdbcTemplate;

	@PostConstruct
	public void setUp() {

	}

	public DBUtil() {
		jdbcTemplate=(JdbcTemplate)ApplicationContextUtil.getBean("jdbcTemplate");
	}
}
