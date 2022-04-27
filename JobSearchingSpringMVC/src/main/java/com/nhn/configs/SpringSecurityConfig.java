package com.nhn.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nhn.handlers.LoginHandler;
import com.nhn.handlers.LogoutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "com.nhn.service",
        "com.nhn.repository",
        "com.nhn.controllers",
        "com.nhn.handlers"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private LoginHandler loginHandler;
    @Autowired
    private LogoutHandler logoutHandler;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new  BCryptPasswordEncoder();
    }

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dxorabap0",
                "api_key", "249227552583173",
                "api_secret", "T4aMw9N8UUkaSkcpDA-vgORB_Qg",
                "secure", true
        ));

        return c;
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource message = new ResourceBundleMessageSource();

        message.setBasename("messages");

        return message;
    }


    @Bean
    public LocalValidatorFactoryBean validator() {
        LocalValidatorFactoryBean v = new LocalValidatorFactoryBean();

        v.setValidationMessageSource(messageSource());

        return v;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");

        http.formLogin().successHandler(this.loginHandler)
                .failureUrl("/login?error");
//        http.formLogin().defaultSuccessUrl("/")
//                .failureUrl("/login?error");

//        http.logout().logoutSuccessHandler("/login");
        http.logout().logoutSuccessHandler(this.logoutHandler);


        http.csrf().disable();
    }

}

