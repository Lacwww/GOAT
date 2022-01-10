package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// nno는 현재 화면의 게시판 번호
	@RequestMapping("notice/noticeReplyList")
	public String replyList(int no_num, Model model) {
		List<NoticeReply> nrList = nrs.list(no_num);
		System.out.println("nrList:"+nrList);
		model.addAttribute("nrList", nrList);
		
		return "notice/noticeReplyList";
	}
	
//	@RequestMapping("/rInsert")
//	public String rInsert(ReplyBoard rb) {
//		rbs.insert(rb);
//		//  결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward
//		return "redirect:/replyList/bno/"+rb.getBno();
//	}
//	
//	@RequestMapping("/rDelete")
//	public String rDelete(ReplyBoard rb) {
//		rbs.delete(rb);
//		return "redirect:/replyList/bno/"+rb.getBno();
//	}
//	
//	@RequestMapping("/rUpdate")
//	public String rUpdate(ReplyBoard rb) {
//		rbs.update(rb);
//		return "redirect:/replyList/bno/"+rb.getBno();
//	}
}