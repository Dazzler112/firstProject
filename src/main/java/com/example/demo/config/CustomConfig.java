package com.example.demo.config;

import org.springframework.context.annotation.*;

@Configuration
@EnableMethodSecurity

public class CustomConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
		http.csrf().disable();
		http.autho
		
	}
}
