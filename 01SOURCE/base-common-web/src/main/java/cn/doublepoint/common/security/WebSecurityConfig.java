package cn.doublepoint.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;

import cn.doublepoint.commonutil.ApplicationContextUtil;

/**
 * 自定义身份验证类（用于重写WebSecurityConfigurerAdapter默认配置）
 * @Configuration     表示这是一个配置类
 * @EnableWebSecurity    允许security
 * configure()     该方法重写了父类的方法，用于添加用户与角色
 * */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
	@Autowired
    private MyFilterSecurityInterceptor myFilterSecurityInterceptor;



    @Bean
    UserDetailsService customUserService(){ //注册UserDetailsService 的bean
        return new CustomUserService();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserService()); //user Details Service验证
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
//        		.antMatchers(ApplicationContextUtil.getApplicationName()+"/js/**",ApplicationContextUtil.getApplicationName()+"/login/**",ApplicationContextUtil.getApplicationName()+"/plugins/**",ApplicationContextUtil.getApplicationName()+"/css/**", ApplicationContextUtil.getApplicationName()+"/message/").permitAll()
        		.antMatchers("/js/**","/login/**","/plugins/**","/css/**", "/message/").permitAll()
                .anyRequest().authenticated() //任何请求,登录后可以访问
                .and()
                .formLogin()
                .loginPage("/login/")
                .successForwardUrl("/sys/index")
                .failureUrl("/login/?error")
                .permitAll() //登录页面用户任意访问
                .and()
                .logout().permitAll(); //注销行为任意访问
        http.csrf().disable();//在原本的配置文件下添加这行代码，禁用security的csrf 
//        http.addFilterBefore(myFilterSecurityInterceptor, FilterSecurityInterceptor.class);
    }
}