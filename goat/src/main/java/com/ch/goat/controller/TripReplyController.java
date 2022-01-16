package com.ch.goat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.TripReply;
import com.ch.goat.service.TripReplyService;

@Controller
public class TripReplyController {
	@Autowired
	private TripReplyService trs;
	
	@RequestMapping("trip/tripReplyList")
	public String replyList(int t_num, Model model) {
		List<TripReply> trList = trs.list(t_num);
		
		model.addAttribute("trList", trList);
		
		return "trip/tripReplyList";
	}
	
	@RequestMapping("trip/trInsert")
	public String trInsert(TripReply tr, HttpSession session) {
		int m_num = (Integer) session.getAttribute("m_num");
		int number = trs.maxNum(); // 새 댓글 번호 생성, ref는 tre_num이랑 똑같음
		
		// ref 답변글끼리 뭉칠때, re_step 답변글 순서, re_level 들여쓰기
		int tre_re_step = 0, tre_re_level = 0; // 첫번째 댓글은 0,0 기본 세팅
		int t_num = tr.getT_num(); // 어떤 글에 댓글 썼는지 번호 가져오기(jsp에서 보냈음)
		int tre_num = tr.getTre_num(); // 어떤 댓글에 댓글 남긴건지(jsp에서 보냈음)
		String tre_content = tr.getTre_content(); // 댓글내용(jsp에서 보냈음)
		
		if(tre_num != 0) { // 댓글에 댓글을 달 때
			TripReply tr1 = trs.select(tre_num); // 읽어온 댓글의 re_step과 re_level을 알기 위해서
			if(tr1.getTre_re_step() == 0 && tr1.getTre_re_level() == 0) {
				tr.setTre_ref(tre_num); // 대댓글끼리 뭉치기위해, 부모댓글의 댓글번호로 ref 세팅
				int maxStep = trs.maxStep(tr1.getTre_ref()); // 댓글중에서 새로운 댓글 달때 맨 밑으로 가기 위해서
				tr.setTre_re_step(maxStep);
				tr.setTre_re_level(tr1.getTre_re_level() + 1);
			}
			else { // 댓글의 대댓글을 달 때
				tr.setTre_ref(tr1.getTre_ref()); // 대댓글끼리 뭉치기위해, 부모댓글의 댓글번호로 ref 세팅
				tr.setTre_re_step(tr1.getTre_re_step());
				// 새로운 댓글은 사이에 껴야되기 때문에
				trs.updateStep(tr); // 글을 읽고 ref가 같고 re_step이 읽은 글의 re_step보다 크면 그글의 re_step + 1
				
				tr.setTre_ref(tr1.getTre_ref());
				tr.setTre_re_step(tr1.getTre_re_step() + 1);   // 댓글(읽은값)단 re_step보다 1 증가
				tr.setTre_re_level(tr1.getTre_re_level() + 1); // 댓글(읽은값)단 re_level보다 1 증가
			}
		} else {
			tr.setTre_ref(number);
			tr.setTre_re_step(tre_re_step); // 기본 댓글에는 0세팅
			tr.setTre_re_level(tre_re_level); //     "
		}

		tr.setTre_content(tre_content);
		tr.setTre_num(number);
		tr.setT_num(t_num);
		tr.setM_num(m_num);

		trs.insert(tr);
		
	//  결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward
		return "redirect:/trip/tripReplyList.do?t_num="+tr.getT_num();
	}
	
	@RequestMapping("trip/rDelete")
	public String rDelete(TripReply tr) {
		trs.delete(tr);
	//  결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward
		return "redirect:/trip/tripReplyList.do?t_num="+tr.getT_num();
	}
	
	@RequestMapping("trip/rUpdate")
	public String rUpdate(TripReply tr) {
		trs.update(tr);
		return "redirect:/trip/tripReplyList.do?t_num="+tr.getT_num();
	}
}