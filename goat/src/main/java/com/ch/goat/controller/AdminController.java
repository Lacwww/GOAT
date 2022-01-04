package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.service.AdminService;
import com.ch.goat.service.PlaceService;

@Controller
public class AdminController {
	@Autowired
	private AdminService as;
	
	@RequestMapping("admin")
	public String admin() {
		return "admin/admin";
	}
	
	@RequestMapping("adminPlace")
	public String adminPlace(String pageNum, Model model) {
		int rowPerPage = 20;
		int pagePerBlock = 5;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalPlace();
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Place> list = as.placeList(startRow, endRow);
		int totalPage = (int)(Math.ceil((double)total/rowPerPage));
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("list", list);
		return "admin/adminPlace";
	}
	
	@RequestMapping("adminSchedule")
	public String adminSchedule(String pageNum, Model model) {
		int rowPerPage = 20;
		int pagePerBlock = 5;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalSchedule();
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Schedule> list = as.scheduleList(startRow, endRow);
		int totalPage = (int)(Math.ceil((double)total/rowPerPage));
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("list", list);
		return "admin/adminSchedule";
	}
	
	@RequestMapping("adminMember")
	public String adminMember(String pageNum, Model model) {
		int rowPerPage = 20;
		int pagePerBlock = 5;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalMember();
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Member> list = as.memberList(startRow, endRow);
		int totalPage = (int)(Math.ceil((double)total/rowPerPage));
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("list", list);
		return "admin/adminMember";
	}
}