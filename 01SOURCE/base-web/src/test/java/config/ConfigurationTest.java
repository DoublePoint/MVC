/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月15日
* 
* 类   说   明 ：配置文件
* 
* 修   改   人：          修   改   日   期：
*/
package config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.alibaba.druid.pool.DruidDataSource;

@Configuration
@EnableTransactionManagement
@ComponentScan({ "cn.doublepoint" })
@EnableJpaRepositories({ "cn.doublepoint" })
public class ConfigurationTest {
	private static final String PROPERTY_NAME_HIBERNATE_DIALECT = "hibernate.dialect";
	private static final String PROPERTY_NAME_HIBERNATE_SHOW_SQL = "hibernate.show_sql";

	@Bean
	public DataSource dataSource() {
		DruidDataSource ds = new DruidDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("mysql://localhost:3306/test?generateSimpleParameterMetadata=true&characterEncoding=utf8");
		ds.setUsername("root");
		ds.setPassword("123456");
		return ds;
	};

	public ConfigurationTest() {
		System.out.println("run base-web ConfigurationTest");
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setDataSource(dataSource());
		entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistenceProvider.class);
		entityManagerFactoryBean.setPackagesToScan("cn.doublepoint");
//		entityManagerFactoryBean.setJpaProperties(hibProperties());
		return entityManagerFactoryBean;
	}

	@Bean
	public JpaTransactionManager transactionManager() {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
		return transactionManager;
	}

//	private Properties hibProperties() {
//		Properties properties = new Properties();
//		properties.put(PROPERTY_NAME_HIBERNATE_DIALECT, "org.hibernate.dialect.MySQL5InnoDBDialect");
//		properties.put(PROPERTY_NAME_HIBERNATE_SHOW_SQL, true);
//		properties.put("hibernate.hbm2ddl.auto", "update");
//		return properties;
//	}

}
