package com.ch.goat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.NoticeReply;
import com.ch.goat.service.NoticeReplyService;

@Controller
public class NoticeReplyController {
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
		int number = nrs.maxNum(); // 새 댓글 번호 생성, ref는 nor_num이랑 똑같음
		
		// ref 답변글끼리 뭉칠때, re_step 답변글 순서, re_level 들여쓰기
		int nor_re_step = 0, nor_re_level = 0; // 첫번째 댓글은 0,0 기본 세팅
		int no_num = nr.getNo_num(); // 어떤 글에 댓글 썼는지 번호 가져오기(jsp에서 보냈음)
		int nor_num = nr.getNor_num(); // 어떤 댓글에 댓글 남긴건지(jsp에서 보냈음)
		String nor_content = nr.getNor_content(); // 댓글내용(jsp에서 보냈음)
		
		if(nor_num != 0) { // 댓글에 댓글을 달 때
			NoticeReply nr1 = nrs.select(nor_num); // 읽어온 댓글의 re_step과 re_level을 알기 위해서
			if(nr1.getNor_re_step() == 0 && nr1.getNor_re_level() == 0) {
				nr.setNor_ref(nor_num); // 대댓글끼리 뭉치기위해, 부모댓글의 댓글번호로 ref 세팅
				int maxStep = nrs.maxStep(nr1.getNor_ref()); // 댓글중에서 새로운 댓글 달때 맨 밑으로 가기 위해서
				nr.setNor_re_step(maxStep);
				nr.setNor_re_level(nr1.getNor_re_level() + 1);
			}
			else { // 댓글의 대댓글을 달 때
				nr.setNor_ref(nr1.getNor_ref()); // 대댓글끼리 뭉치기위해, 부모댓글의 댓글번호로 ref 세팅
				nr.setNor_re_step(nr1.getNor_re_step());
				// 새로운 댓글은 사이에 껴야되기 때문에
				nrs.updateStep(nr); // 글을 읽고 ref가 같고 re_step이 읽은 글의 re_step보다 크면 그글의 re_step + 1
				
				nr.setNor_ref(nr1.getNor_ref());
				nr.setNor_re_step(nr1.getNor_re_step() + 1);   // 댓글(읽은값)단 re_step보다 1 증가
				nr.setNor_re_level(nr1.getNor_re_level() + 1); // 댓글(읽은값)단 re_level보다 1 증가
			}
		} else {
			nr.setNor_ref(number);
			nr.setNor_re_step(nor_re_step); // 기본 댓글에는 0세팅
			nr.setNor_re_level(nor_re_level); //     "
		}

		nr.setNor_content(nor_content);
		nr.setNor_num(number);
		nr.setNo_num(no_num);
		nr.setM_num(m_num);

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