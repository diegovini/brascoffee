package com.brascoffee.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.brascoffee.filter.JwtRequestFilter;
import com.brascoffee.service.UserService;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfigurer extends WebSecurityConfigurerAdapter {
	@Autowired
	UserService userService;
	
	@Autowired
	JwtRequestFilter jwtRequestFilter;

	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		// TODO Auto-generated method stub
		return super.authenticationManagerBean();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		// TODO Auto-generated method stub
		auth.userDetailsService(userService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().cors().and()
			.authorizeRequests()
			.antMatchers("/auth").permitAll()
			.antMatchers("/register").permitAll()
			//.antMatchers("/beverages").hasAuthority("ADMIN")
			.anyRequest().authenticated()
			.and().sessionManagement()
			.sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
		
		
		
	}
	
	@Bean
	public PasswordEncoder passWordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
