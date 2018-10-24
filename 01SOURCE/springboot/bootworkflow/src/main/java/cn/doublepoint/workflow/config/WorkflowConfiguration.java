/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： Oct 15, 2018
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*//*
package cn.doublepoint.workflow.config;

import java.util.Map;

import javax.sql.DataSource;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Primary;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
@Configuration
@EnableTransactionManagement
@ComponentScan(value = { "org.activiti.conf", "org.activiti.rest.editor", "org.activiti.rest.service" },
	excludeFilters={@Filter(type = FilterType.ANNOTATION, value = Controller.class),
})
public class WorkflowConfiguration {
	@Autowired
	EntityManagerFactoryBuilder builder;

	@Bean
	public SpringProcessEngineConfiguration processEngineConfiguration() {
		SpringProcessEngineConfiguration configuration = new SpringProcessEngineConfiguration();
		configuration.setDataSource(dataSource());
		configuration.setTransactionManager(transactionManager());
		configuration.setDatabaseSchemaUpdate("true");
		configuration.setJobExecutorActivate(true);
		configuration.setProcessDefinitionCacheLimit(10);
		configuration.setLabelFontName("宋体");
		configuration.setAnnotationFontName("宋体");
		return configuration;
	}

	@Primary
	@Bean(name = "dataSourceProperties")
	@Qualifier("dataSourceProperties")
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSourceProperties dataSourceProperties() {
		return new DataSourceProperties();
	}

	@Primary
	@Bean(name = "dataSource")
	@Qualifier("dataSource")
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource dataSource() {
		return dataSourceProperties().initializeDataSourceBuilder().build();
	}

	@Primary
	@Bean(name = "transactionManager")
	public PlatformTransactionManager transactionManager() {
		return new JpaTransactionManager(entityManagerFactory().getObject());
	}

	@Primary
	@Bean(name = "entityManagerFactory")
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		return builder.dataSource(dataSource()).properties(getVendorProperties())
				.packages("me.kafeitu.demo.activiti.entity.oa") // 设置实体类所在位置
				.persistenceUnit("persistenceUnit").build();
	}

	private Map<String, Object> getVendorProperties() {
		HibernateSettings hibernateSettings = new HibernateSettings();
		Map<String, Object> props = jpaProperties.getHibernateProperties(hibernateSettings);
		props.put("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
		props.put("hibernate.ejb.naming_strategy", "org.hibernate.cfg.ImprovedNamingStrategy");
		props.put("hibernate.hbm2ddl.auto", "update");
		return props;
	}

	@Bean
	public HibernateJpaVendorAdapter hibernateJpaVendorAdapter() {
		return new HibernateJpaVendorAdapter();
	}

	@Bean
	public ProcessEngineFactoryBean processEngine(SpringProcessEngineConfiguration configuration) {
		ProcessEngineFactoryBean factory = new ProcessEngineFactoryBean();
		factory.setProcessEngineConfiguration(configuration);
		return factory;
	}

	@Bean
	public RepositoryService repositoryService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getRepositoryService();
	}

	@Bean
	public RuntimeService runtimeService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getRuntimeService();
	}

	@Bean
	public FormService formService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getFormService();
	}

	@Bean
	public IdentityService identityService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getIdentityService();
	}

	@Bean
	public TaskService taskService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getTaskService();
	}

	@Bean
	public HistoryService historyService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getHistoryService();
	}

	@Bean
	public ManagementService managementService(ProcessEngineFactoryBean factory) {
		return factory.getProcessEngineConfiguration().getManagementService();
	}

	
	 * <!-- 单例json对象 --><!-- 集成REST服务需要的bean --> <bean id="objectMapper"
	 * class="com.fasterxml.jackson.databind.ObjectMapper"/> <bean
	 * id="restResponseFactory"
	 * class="org.activiti.rest.service.api.RestResponseFactory" /> <bean
	 * id="contentTypeResolver"
	 * class="org.activiti.rest.common.application.DefaultContentTypeResolver"
	 * />
	 
	@Autowired
	private JpaProperties jpaProperties;
}
*/