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

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
public class WebConfiguration {

	@Bean(name = "adminDataSource")
    @ConfigurationProperties(prefix = "spring.datasource")
    @Primary
    public DataSource adminDataSource() {
        return DataSourceBuilder.create().build();
    }

	@Autowired
    private DataSource dataSource;

    @Bean
    public EntityManagerFactory entityManagerFactory() {
        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();

        LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
        factory.setJpaVendorAdapter(vendorAdapter);
        //此处com.example.*.model是你的java bean所在的包名
        factory.setPackagesToScan("cn.doublepoint.*");
        factory.setDataSource(dataSource);

        Map<String, Object> jpaProperties = new HashMap<String, Object>();
        jpaProperties.put("hibernate.ejb.naming_strategy","org.hibernate.cfg.ImprovedNamingStrategy");
        jpaProperties.put("hibernate.jdbc.batch_size",50);

        factory.setJpaPropertyMap(jpaProperties);
        factory.afterPropertiesSet();
        return factory.getObject();
    }

    @Bean
    public PlatformTransactionManager transactionManager() {

        JpaTransactionManager txManager = new JpaTransactionManager();
        txManager.setEntityManagerFactory(entityManagerFactory());
        return txManager;
    }

}
