package org.khmeracademy.rest.pp.entity.service;

import org.khmeracademy.rest.pp.entity.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
@Qualifier("myUserDetailServiceImpl")
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private HttpHeaders headers;
	
	String baseUrl = "http://localhost:8888/login" ;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("hello " + username);
		HttpEntity<String> requestEntity = new HttpEntity<>(headers) ;
		ResponseEntity<Member> response = restTemplate.exchange(baseUrl + "?email=" + username , HttpMethod.GET, requestEntity, Member.class);
		System.out.println("ui login=>" + response.getBody());
		Member member = response.getBody();
		if(member==null)
			throw new UsernameNotFoundException("==>User not found!!!");
		return member;
	}
	
	
	
}
