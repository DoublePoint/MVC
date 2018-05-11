///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2017年10月14日
//* 
//* 类   说   明 ：配置文件
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package cn.doublepoint.common.config;
//
//import java.util.Properties;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.FlushModeType;
//import javax.sql.DataSource;
//
//import org.hibernate.jpa.HibernatePersistenceProvider;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.orm.jpa.JpaTransactionManager;
//import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//
//import cn.doublepoint.commonutil.domain.model.Log4jUtil;
//
//@Configuration
//@EnableTransactionManagement
//@ComponentScan("cn.doublepoint")
//@EnableJpaRepositories("cn.doublepoint")
//public class AutoConfiguration {
//	private static final String PROPERTY_NAME_HIBERNATE_DIALECT = "hibernate.dialect";
//	private static final String PROPERTY_NAME_HIBERNATE_SHOW_SQL = "hibernate.show_sql";
//	private static final String PROPERTY_NAME_HIBERNATE_FORMAT_SQL = "hibernate.format_sql";
//
//	@Autowired
//	DataSource dataSource;
//
//	public AutoConfiguration() {
//		Log4jUtil.info("Run base-common AutoConfiguration");
//	}
//
////	@Bean
////	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
////		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
////		entityManagerFactoryBean.setDataSource(dataSource);
////		entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistenceProvider.class);
////		entityManagerFactoryBean.setPackagesToScan("cn.doublepoint");
////		entityManagerFactoryBean.setJpaProperties(hibProperties());
////		return entityManagerFactoryBean;
////	}
//	
//	@Bean 
//	public EntityManager entityManager(EntityManagerFactory entityManagerFactory){
//		EntityManager entityManager = entityManagerFactory.createEntityManager();
//		entityManager.setFlushMode(FlushModeType.AUTO);
//		return entityManager;
//	}
//
//	@Bean
//	public JpaTransactionManager transactionManager() {
//		JpaTransactionManager transactionManager = new JpaTransactionManager();
//		transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
//		return transactionManager;
//	}
//
//	@Bean
//	public JdbcTemplate jdbcTemplate(DataSource dataSource) {
//		JdbcTemplate jdbcTemplate = new JdbcTemplate();
//		jdbcTemplate.setDataSource(dataSource);
//		return jdbcTemplate;
//	}
//
//	private Properties hibProperties() {
//		Properties properties = new Properties();
//		properties.put(PROPERTY_NAME_HIBERNATE_DIALECT, "org.hibernate.dialect.MySQL5InnoDBDialect");
//		properties.put(PROPERTY_NAME_HIBERNATE_SHOW_SQL, true);
//		properties.put(PROPERTY_NAME_HIBERNATE_FORMAT_SQL, false);
//		properties.put("hibernate.hbm2ddl.auto", "update");
//		return properties;
//	}
//
////	@Bean
////	public MultipartResolver multipartResolver() throws IOException {
////		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
////		multipartResolver.setUploadTempDir(new FileSystemResource("/tmp/spittr/uploads"));
////		return multipartResolver;
////	}
//}
