package com.solinfbroker.apigeral.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class WebSecurityConfig {
    private static final String[] AUTH_WHITE_LIST = {
        "/api/v1/auth/**",
        "/v3/api-docs/**",
        "/v3/api-docs.yaml",
        "/swagger-ui/**",
        "/swagger-ui.html"
    };
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{

        return httpSecurity
        .csrf(csrf -> csrf.disable())
        .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
        .authorizeHttpRequests(authorize -> authorize
            .requestMatchers(AUTH_WHITE_LIST).permitAll()    
            .anyRequest().permitAll()
           )
        .build();
    }

}
