package cn.doublepoint.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("cn.doublepoint")
//@EnableAutoConfiguration(exclude = { 
//		org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class,})
public class BootwebVueApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootwebVueApplication.class, args);
	}
}
