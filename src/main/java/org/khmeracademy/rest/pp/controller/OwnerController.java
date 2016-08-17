package org.khmeracademy.rest.pp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OwnerController {
	@RequestMapping(value="/owner")
	public String homeowner(){
		return "owner/layout/home_view";
	}
	@RequestMapping(value="/aboutowner")
	public String aboutowner(){
		return "owner/layout/about_view";
	}
	@RequestMapping(value="/detail")
	public String detailowner(){
		return "owner/layout/detail_view";
	}
	@RequestMapping(value="/search")
	public String searchlowner(){
		return "owner/layout/search_view";
	}
}
