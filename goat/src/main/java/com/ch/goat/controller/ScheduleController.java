package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.goat.model.Area;
import com.ch.goat.model.Place;
import com.ch.goat.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;

	@RequestMapping("selectArea")
	public String selectArea(Model model) {
		List<Area> list = ss.list();
		model.addAttribute("list",list);
		return "schedule/selectArea";
	}
	@RequestMapping("selectModal")
	public String selectModal(Model model,String place_area) {
		Area area = ss.select(place_area);
		model.addAttribute("area",area);
		return "schedule/selectModal";
	}
	@RequestMapping("makeScheduleForm")
	public String makeSchedule(Model model, String place_area) {
		model.addAttribute("place_area",place_area);
		return "schedule/makeScheduleForm";
	}
	@RequestMapping("placeList") 
	public String placeList(Model model, Place place) {
		List<Place> plist = ss.plist(place);
		String[] t = {"장소명","테마"};
		model.addAttribute("place",place);
		model.addAttribute("t",t);
		model.addAttribute("plist",plist);
		return "schedule/placeList"; 
	}

}
