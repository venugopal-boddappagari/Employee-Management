package com.Employee.Management.security;

import javax.sql.DataSource;
import org.springframework.security.config.Customizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class EmployeeSecurity {

	/*
	 * @Bean public PasswordEncoder passwordEncoder() { return
	 * PasswordEncoderFactories.createDelegatingPasswordEncoder(); }
	 * 
	 * @Bean public InMemoryUserDetailsManager users( PasswordEncoder
	 * passwordEncoder) {
	 * 
	 * UserDetails user1 = User.builder() .username("kallamadi")
	 * .password(passwordEncoder.encode("anjesh")) .roles("cse") .build();
	 * 
	 * UserDetails user2 = User.builder() .username("boddappagari")
	 * .password(passwordEncoder.encode("venugopal")) .roles("eie") .build();
	 * 
	 * UserDetails user3 = User.builder() .username("mmmmm")
	 * .password(passwordEncoder.encode("mmmmm")) .roles("mech") .build();
	 * 
	 * return new InMemoryUserDetailsManager(user1, user2, user3); }
	 * 
	 * @Bean public SecurityFilterChain securityFilterChain(HttpSecurity http)
	 * throws Exception {
	 * 
	 * http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated() );
	 * 
	 * http.formLogin(form -> form.permitAll());
	 * 
	 * return http.build(); }
	 */

	@Bean
	public UserDetailsManager userConfiguration(DataSource datasource) {
		UserDetailsManager manager=new JdbcUserDetailsManager(datasource);
	return manager;
	}

@Bean
public SecurityFilterChain configuratin(HttpSecurity http) throws Exception {

    http

    .csrf(csrf -> csrf.disable())
    .
    authorizeHttpRequests(authorize -> authorize
        .requestMatchers(HttpMethod.PUT, "/api/employees/**")
            .hasAuthority("ROLE_Students")
        .requestMatchers(HttpMethod.DELETE, "/api/employees/**")
            .hasAuthority("ROLE_employees")
        .anyRequest().authenticated()
    )
    .httpBasic(Customizer.withDefaults());

    return http.build();
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}