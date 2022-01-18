package com.ch.goat.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;
import com.ch.goat.service.AdminService;
import com.ch.goat.service.MemberService;


@Controller
public class AdminController {
	@Autowired
	private AdminService as;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("admin/admin")
	public String admin() {
		return "admin/admin";
	}
	
	@RequestMapping("admin/adminPlace")
	public String adminPlace(String pageNum, String cate, String search, Model model) {
		int rowPerPage = 20;
		int pagePerBlock = 5;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		if (cate == null || cate.equals("")) cate="null";
		if (search == null || search.equals("")) search="null"; 
		int currentPage = Integer.parseInt(pageNum);

		int total = as.getTotalPlace(cate, search);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Place> list = as.placeList(startRow, endRow, cate, search);
		int totalPage = (int)(Math.ceil((double)total/rowPerPage));
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;	
		}
		List<Place> cateList = as.getCateList();
		System.out.println(cateList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("list", list);
		model.addAttribute("cateList", cateList);
		return "admin/adminPlace";
	}
	
	@RequestMapping("admin/adminSchedule")
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
	
	@RequestMapping("admin/adminMember")
	public String adminMember(String pageNum, Model model) {
		int rowPerPage = 20;
		int pagePerBlock = 5;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalMember();
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Member> list = as.memberList(startRow, endRow);
		System.out.println(list+"sdfsdf");
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

	@RequestMapping("admin/adminMemberDelete")
	public String delete(String m_id, String pageNum, Model model) {
		int result = ms.delete(m_id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "admin/adminMemberDelete";
	}
	
	@RequestMapping("admin/adminTempPlace")
	public String request(String pageNum, Model model) {
		int rowPerPage = 20;
		int pagePerBlock = 5;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotalTempPlace();
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<TempPlace> list = as.tempPlaceList(startRow, endRow);
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
		
		return "admin/adminTempPlace";
	}
}