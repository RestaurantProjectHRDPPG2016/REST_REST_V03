package org.khmeracademy.rest.pp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller

public class MainController {
	@RequestMapping(value="/")
	public String home(){
		return "user/layout/home_view";
	}
		@RequestMapping(value="/about")
		public String about(){
			return "user/layout/about_view";
		}
		
		@RequestMapping(value="/login")
		public String user_login(){
			return "user/layout/user_login_view";
		}
		
		@RequestMapping(value="/signup")
		public String user_signup(){
			return "user/layout/user_signup_view";
		}
}
