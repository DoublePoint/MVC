package cn.doublepoint.workflow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("cn.doublepoint")
@EnableAutoConfiguration(exclude = { 
		org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class,
		org.activiti.spring.boot.SecurityAutoConfiguration.class,})
public class BootworkflowApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootworkflowApplication.class, args);
	}
}
