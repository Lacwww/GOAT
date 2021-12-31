package com.ch.goat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;
	
}
