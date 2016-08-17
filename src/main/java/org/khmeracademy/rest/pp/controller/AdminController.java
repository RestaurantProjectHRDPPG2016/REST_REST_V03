package org.khmeracademy.rest.pp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value="/admin")
	public String admin(){
		return "admin/layout/admin_view";
	}
	@RequestMapping(value="/members")
	public String member(){
		return "admin/layout/member_view";
	}
	@RequestMapping(value="/category")
	public String category(){
		return "admin/layout/category_view";
	}
	@RequestMapping(value="/restaurant")
	public String restaurant(){
		return "admin/layout/restaurant_view";
	}
	@RequestMapping(value="/location")
	public String location(){
		return "admin/layout/location_view";
	}
	@RequestMapping(value="/general")
	public String general(){
		return "admin/layout/general_view";
	}
	@RequestMapping(value="/setting")
	public String setting(){
		return "admin/layout/setting_view";
	}
	@RequestMapping(value="/views")
	public String view(){
		return "admin/layout/views_view";
	}
	@RequestMapping(value="/event")
	public String event(){
		return "admin/layout/event_view";
	}
	@RequestMapping(value="/history")
	public String history(){
		return "admin/layout/history_view";
	}
	@RequestMapping(value="/restaurant_detail_view/{id}")
	public String restaurantDetail(@PathVariable int id , ModelMap model){
		model.addAttribute("id",id);
		return "admin/layout/restaurant_detail_view";
	}
}
