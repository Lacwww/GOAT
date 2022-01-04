package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println("place_area controller: "+place_area);
		return "schedule/makeScheduleForm";
	}
	@RequestMapping("placeList")
	public String placeList(Model model, String place_area) {
		List<Place> plist = ss.plist(place_area);
		model.addAttribute("plist",plist);
		System.out.println(plist.size());
		return "schedule/placeList";
	}

}
