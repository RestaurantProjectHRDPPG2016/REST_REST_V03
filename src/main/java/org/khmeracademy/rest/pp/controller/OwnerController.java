package org.khmeracademy.rest.pp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OwnerController {
	@RequestMapping(value = "/owner/{id}")
	public String homeowner(@PathVariable int id, ModelMap model) {
		model.addAttribute("id", id);
		return "owner/layout/home_view";
	}

	@RequestMapping(value = "/aboutowner")
	public String aboutowner() {
		return "owner/layout/about_view";
	}

	@RequestMapping(value = "/detail/{id}")
	public String detailowner(@PathVariable int id, ModelMap model) {
		model.addAttribute("id", id);
		return "owner/layout/detail_view";
	}
//
//	, @PathVariable String c_id, @PathVariable String type_id,
//	@PathVariable String province, @PathVariable String district, @PathVariable String commune,
	
	@RequestMapping(value = "/search_result")
	public String searchlowner(
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="category", required=false) String category,
			@RequestParam(value="province", required=false) String province,
			@RequestParam(value="district", required=false) String district,
			@RequestParam(value="commune", required=false) String commune,
			ModelMap model) {
		
		System.out.println(name + ", " + category + ", " + province + ", " + district + ", " + commune);
		model.addAttribute("name", name);
		model.addAttribute("category", category);
		model.addAttribute("province", province);
		model.addAttribute("district", district);
		model.addAttribute("commune", commune);
		return "owner/layout/search_view";
	}

	@RequestMapping(value = "/locations/{id}")
	public String locationowner(@PathVariable int id, ModelMap model) {
		model.addAttribute("id", id);
		return "owner/layout/location_view";
	}

	@RequestMapping(value = "/typerestaurant/{id}")
	public String typerestaurant(@PathVariable int id, ModelMap model) {
		model.addAttribute("id", id);
		return "owner/layout/home_view";
	}

	@RequestMapping(value = "/404")
	public String notfound() {

		return "owner/layout/home_notfound";
	}
}
