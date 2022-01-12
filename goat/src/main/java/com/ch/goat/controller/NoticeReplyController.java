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

import com.ch.goat.model.Cs;
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
		int nor_num = nr.getNor_num();
		String nor_content = nr.getNor_content();
		
		nr.setNor_re_step(nor_re_step);
		nr.setNor_re_level(nor_re_level);
		
		if(nor_num != 0) { // 대댓글
			NoticeReply nr1 = nrs.select(nor_num);
			nr.setNor_ref(nor_num);
			
			nr.setNor_re_level(nr1.getNor_re_level());
			nr.setNor_re_step(nr1.getNor_re_step());
			
			// 글을 일고 ref가 같고 re_step이 읽은 글의 re_step보다 크면 그글의 re_step + 1
			nrs.updateStep(nr);
			// re_step과 re_level은 읽은 값 더하기 1
			
			nr.setNor_content(nor_content);
			nr.setNor_re_level(nr.getNor_re_level() + 1);
			nr.setNor_re_step(nr.getNor_re_step() + 1);
		} else nr.setNor_ref(number);
		
		nr.setNor_num(number);
		nr.setM_num(m_num);
		nr.setNo_num(no_num);
		
		
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