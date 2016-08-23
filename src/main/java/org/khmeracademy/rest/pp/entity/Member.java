package org.khmeracademy.rest.pp.entity;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int user_id;
	private String username;
	private String password;
	private String email;
	private String status;
	private List<Role> roles;
	
	
	public int getUserid() {
		return user_id;
	}
	public void setUserid(int user_id) {
		this.user_id = user_id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "User [userid=" + user_id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", status=" + status + ", roles=" + roles + "]";
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roles;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return email;
	}
	

	
}
