package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Place;
import com.ch.goat.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;
	
	@RequestMapping("selectArea")
	public String selectArea(Model model) {
		return "schedule/selectArea";
	
	}

}
