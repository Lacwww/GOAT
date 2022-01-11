package com.ch.goat.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.NoticeReply;
import com.ch.goat.service.NoticeReplyService;
import com.ch.goat.service.NoticeService;

@Controller
public class NoticeReplyController {
	@Autowired
	private NoticeService ns;
	@Autowired
	private NoticeReplyService nrs;
	
	@RequestMapping("notice/noticeReplyList")
	public String replyList(int no_num, Model model) {
		List<NoticeReply> nrList = nrs.list(no_num);
		
		model.addAttribute("nrList", nrList);
		
		return "notice/noticeReplyList";
	}
	
	@RequestMapping("notice/rInsert")
	public String rInsert(NoticeReply nr, HttpSession session) {
		int m_num = (Integer) session.getAttribute("m_num");
		// ref 답변글끼리 뭉칠때, re_level 들여쓰기, re_step 답변글 순서
		int number = nrs.maxNum(); // 새 게시글 번호 생성
		int nor_re_step = 0, nor_re_level = 0;
		int no_num = nr.getNo_num();
		
		nr.setNor_num(number);
		nr.setM_num(m_num);
		nr.setNo_num(no_num);
		nr.setNor_ref(number);
		nr.setNor_re_step(nor_re_step);
		nr.setNor_re_level(nor_re_level);
		nrs.insert(nr);
		
	//  결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward
		return "redirect:/notice/noticeReplyList.do?no_num="+nr.getNo_num();
	}
	
	@RequestMapping("notice/rDelete")
	public String rDelete(NoticeReply nr) {
		nrs.delete(nr);
	//  결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward
		return "redirect:/notice/noticeReplyList.do?no_num="+nr.getNo_num();
	}
	
	@RequestMapping("notice/rUpdate")
	public String rUpdate(NoticeReply nr) {
		nrs.update(nr);
		return "redirect:/notice/noticeReplyList.do?no_num="+nr.getNo_num();
	}
}