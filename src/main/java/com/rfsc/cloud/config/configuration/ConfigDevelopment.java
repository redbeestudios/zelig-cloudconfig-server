package com.rfsc.cloud.config.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//TODO, shouldn't prod be here, but only when our apps could handle this.
@Configuration
@Profile({"local", "development", "qa", "uat", "production"})
@Slf4j
public class ConfigDevelopment extends WebSecurityConfigurerAdapter {

    private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger("ConfigDevelopment");

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        log.info("Configuracion de seguridad para DESARROLLO - Zelig");
        http.csrf()
            .disable()
            .authorizeRequests()
            .antMatchers("/**")
            .permitAll();
    }
}
