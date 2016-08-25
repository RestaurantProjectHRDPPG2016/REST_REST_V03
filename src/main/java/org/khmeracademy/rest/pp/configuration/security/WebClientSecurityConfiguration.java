package org.khmeracademy.rest.pp.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class WebClientSecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	@Qualifier("myUserDetailServiceImpl")
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		/*auth.inMemoryAuthentication()
			.withUser("admin").password("admin").roles("ADMIN");
		auth.inMemoryAuthentication()
			.withUser("editor").password("editor").roles("EDITOR");*/
		
		auth.userDetailsService(userDetailsService);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		
		http.formLogin()
			.loginPage("/login")
			.usernameParameter("email")
			.passwordParameter("password")
			.permitAll();
		
		http.authorizeRequests()
			.antMatchers("/admin/**").hasAnyRole("ADMIN")
			.antMatchers("/user/**").hasAnyRole("ADMIN", "USER");
	}
}
