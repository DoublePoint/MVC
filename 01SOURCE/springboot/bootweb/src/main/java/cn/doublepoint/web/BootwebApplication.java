package cn.doublepoint.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("cn.doublepoint")
public class BootwebApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootwebApplication.class, args);
	}
}
