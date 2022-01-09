package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Area;
import com.ch.goat.model.Place;
import com.ch.goat.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;

	@RequestMapping("schedule/selectArea")
	public String selectArea(Model model) {
		List<Area> list = ss.list();
		model.addAttribute("list",list);
		return "schedule/selectArea";
	}
	@RequestMapping("schedule/selectModal")
	public String selectModal(Model model,String place_area) {
		Area area = ss.select(place_area);
		model.addAttribute("area",area);
		return "schedule/selectModal";
	} 
	@RequestMapping("schedule/makeScheduleForm")
	public String makeScheduleForm(Model model, String place_area) {
		String[] t = {"장소명","테마"};
		model.addAttribute("t",t);
		model.addAttribute("place_area",place_area);
		return "schedule/makeScheduleForm";
	}
	@RequestMapping("schedule/placeList") 
	public String placeList(Model model, Place place,String search, String keyword) {
		place.setKeyword(keyword);
		place.setSearch(search);
		List<Place> plist = ss.plist(place);
		model.addAttribute("keyword",keyword);
		model.addAttribute("search",search);
		model.addAttribute("place",place);
		model.addAttribute("plist",plist);
		return "schedule/placeList"; 
	}
	@RequestMapping("schedule/makeSchedule.do")
	public String makeSchedule(Model model,String[] id, String s_date, String e_date) {
		model.addAttribute("id",id);
		model.addAttribute("s_date",s_date);
		model.addAttribute("e_date",e_date);
		return "schedule/makeSchedule";
	}
}
