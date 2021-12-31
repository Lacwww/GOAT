package com.ch.goat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.service.CsService;
import com.ch.goat.service.ScheduleService;

@Controller
public class CsController {
	@Autowired
	private CsService cs;
	
	@RequestMapping("csList")
	public String csList() {
		return "cs/csList";
	}
	
	@RequestMapping("csInsertForm")
	public String csInsertForm() {
		return "cs/csInsertForm";
	}
}
