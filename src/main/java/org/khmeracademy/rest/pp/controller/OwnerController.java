package org.khmeracademy.rest.pp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OwnerController {
	@RequestMapping(value="/owner/{id}")
	public String homeowner(@PathVariable int id , ModelMap model){
		model.addAttribute("id",id);
		return "owner/layout/home_view";
	}
	@RequestMapping(value="/aboutowner")
	public String aboutowner(){
		return "owner/layout/about_view";
	}
	@RequestMapping(value="/detail/{id}")
	public String detailowner(@PathVariable int id , ModelMap model){
		model.addAttribute("id",id);
		return "owner/layout/detail_view";
	}
	@RequestMapping(value="/search")
	public String searchlowner(){
		return "owner/layout/search_view";
	}
}
