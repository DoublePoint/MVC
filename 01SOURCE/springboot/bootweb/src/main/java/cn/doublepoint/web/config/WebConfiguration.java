/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： Oct 15, 2018
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.config;

import java.util.Map;

import javax.persistence.EntityManager;
import javax.sql.DataSource;

import org.hibernate.engine.jdbc.connections.internal.DatasourceConnectionProviderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef="entityManagerFactory",
        transactionManagerRef="transactionManager",
        basePackages= { "cn.doublepoint" }) //设置Repository所在位置
public class WebConfiguration {
	@Primary
	@Bean(name = "dataSourceProperties")
    @Qualifier("dataSourceProperties")
    @ConfigurationProperties(prefix="spring.datasource")
    public DataSourceProperties dataSourceProperties(){
        return new DataSourceProperties();
    }
	
	@Primary
	@Bean(name = "dataSource")
    @Qualifier("dataSource")
    @ConfigurationProperties(prefix="spring.datasource")
    public DataSource dataSource(){
        return dataSourceProperties().initializeDataSourceBuilder().build();
    }
 
    @Primary
    @Bean(name = "entityManager")
    public EntityManager entityManager(EntityManagerFactoryBuilder builder) {
        return entityManagerFactory(builder).getObject().createEntityManager();
    }
 
    @Primary
    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory (EntityManagerFactoryBuilder builder) {
        return builder
                .dataSource(dataSource())
                .properties(getVendorProperties())
                .packages("cn.doublepoint") //设置实体类所在位置
                .persistenceUnit("persistenceUnit")
                .build();
    }
 
    @Autowired
    private JpaProperties jpaProperties;
 
    private Map<String, Object> getVendorProperties() {
    	 HibernateSettings hibernateSettings = new HibernateSettings();
         return jpaProperties.getHibernateProperties(hibernateSettings);
    }
 
    @Primary
    @Bean(name = "transactionManager")
    public PlatformTransactionManager transactionManager(EntityManagerFactoryBuilder builder) {
        return new JpaTransactionManager(entityManagerFactory(builder).getObject());
    }
}
