package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Trip;
import com.ch.goat.service.PageBean;
import com.ch.goat.service.TripService;

@Controller
public class TripController {
	@Autowired
	private TripService ts;
	
	@RequestMapping("trip/tripList")
	public String noticeList(Trip trip, String pageNum, Model model) {
		int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ts.getTotal(trip);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		trip.setStartRow(startRow);
		trip.setEndRow(endRow);
		List<Trip> list = ts.list(startRow, endRow);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);

		model.addAttribute("total", total);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		
		return "trip/tripList";
	}
	
//	@RequestMapping("notice/noticeInsertForm")
//	public String noticeInsertForm(Notice notice, String pageNum, HttpSession session, Model model) {
//		String admin_id = (String) session.getAttribute("adminid");
//		Member adminInfo = ms.select(admin_id);
//		
//		model.addAttribute("adminInfo",adminInfo);
//		model.addAttribute("pageNum", pageNum);
//
//		return "notice/noticeInsertForm";
//	}
//
//	@RequestMapping("notice/noticeInsert")
//	public String noticeInsert(Notice notice, String pageNum, Model model) {
//		int number = ns.maxNum(); // 새 게시글 번호 생성
//		
//		notice.setNo_num(number);
//		int result = ns.insert(notice);
//			
//		model.addAttribute("pageNum", pageNum);
//		model.addAttribute("result", result);
//
//		return "notice/noticeInsert";
//	}
//	
//	@RequestMapping("notice/noticeView")
//	public String noticeView(Notice notice, String pageNum, Model model) {
//		int no_num = notice.getNo_num();
//		ns.updateViewcount(no_num);  // 조회수 증가
//		Notice notice2 = ns.select(no_num); // 조회
//		
//		model.addAttribute("pageNum", pageNum);		
//		model.addAttribute("notice", notice2);
//		
//		return "notice/noticeView";
//	}
//	
//	@RequestMapping("notice/noticeDelete")
//	public String noticeDelete(Notice notice, String pageNum, Model model) {
//		int no_num = notice.getNo_num();
//		int result = ns.delete(no_num);
//		
//		model.addAttribute("pageNum", pageNum);
//		model.addAttribute("result", result);
//		
//		return "notice/noticeDelete";
//	}
//	
//	@RequestMapping("notice/noticeUpdateForm")
//	public String noticeUpdateForm(Notice notice, String pageNum, HttpSession session,Model model) {
//		int no_num = notice.getNo_num();
//		Notice notice2 = ns.select(no_num);
//		
//		String admin_id = (String) session.getAttribute("adminid");
//		Member adminInfo = ms.select(admin_id);
//		
//		model.addAttribute("adminInfo", adminInfo);
//		model.addAttribute("notice", notice2);
//		model.addAttribute("pageNum", pageNum);
//		
//		return "notice/noticeUpdateForm";
//	}
//	
//	@RequestMapping("notice/noticeUpdate")
//	public String noticeUpdate(Notice notice, String pageNum, Model model) {
//		int no_num = notice.getNo_num();
//		String no_title = notice.getNo_title();
//		String no_content = notice.getNo_content();
//		
//		notice.setNo_num(no_num);
//		notice.setNo_title(no_title);
//		notice.setNo_content(no_content);
//		int result = ns.update(notice);
//			
//		model.addAttribute("pageNum", pageNum);
//		model.addAttribute("result", result);
//
//		return "notice/noticeUpdate";
//	}
}