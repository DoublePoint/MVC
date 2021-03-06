//package org.activiti.explorer.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//@EnableWebSecurity
//@EnableWebMvcSecurity
//public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
//
//    @Bean
//    public AuthenticationProvider authenticationProvider() {
//        return new BasicAuthenticationProvider();
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authenticationProvider(authenticationProvider())
//            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
//            .csrf().disable()
//            .authorizeRequests()
//            .anyRequest().authenticated()
//            .and()
//            .httpBasic();
//    }
//}
