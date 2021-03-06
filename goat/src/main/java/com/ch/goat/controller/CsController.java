package com.ch.goat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;
import com.ch.goat.service.CsService;
import com.ch.goat.service.MemberService;
import com.ch.goat.service.PageBean;

@Controller
public class CsController {
	@Autowired
	private CsService css;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("cs/csList")
	public String csList(Cs cs, String pageNum, Model model) {
		int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = css.getTotal(cs);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		cs.setStartRow(startRow);
		cs.setEndRow(endRow);
		
		List<Cs> list = css.list(startRow, endRow);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);

		// 답변글로 인한 번호를 보기좋게 다시 설정
		int no = total - startRow + 1;

		model.addAttribute("no", no);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		
		return "cs/csList";
	}
	
	@RequestMapping("cs/csInsertForm")
	public String csInsertForm(Cs cs, String pageNum, HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("id");
		String admin_id = (String) session.getAttribute("adminid");

		if(m_id == null) {
			Member adminInfo = ms.select(admin_id);
			model.addAttribute("adminInfo",adminInfo);
		}
		if(admin_id == null) {
			Member member = ms.select(m_id);
			model.addAttribute("member",member);
		}

		// ref 답변글끼리 뭉칠때, re_level 들여쓰기, re_step 답변글 순서
		int ref = 0, re_level = 0, re_step = 0;
		int cs_num = cs.getCs_num();
		Cs cs1 = null;
		String content = null;
		String title = null;
			
		if(cs_num != 0) {
			cs1 = css.select(cs_num);
			title = cs1.getCs_title();
			content = cs1.getCs_content();
			ref = cs1.getCs_ref();
			re_step = cs1.getCs_re_step();
			re_level = cs1.getCs_re_level();
		}	
		
		model.addAttribute("content", content);
		model.addAttribute("title", title);
		model.addAttribute("cs_num", cs_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
			
		return "cs/csInsertForm";
	}

	@RequestMapping("cs/csInsert")
	public String csInsert(Cs cs, String pageNum, Model model, HttpSession session) {
		int number = css.maxNum(); // 새 게시글 번호 생성
		int result = 0;
		
		if(cs.getCs_num() != 0) { // 답변글
			// 원 글 제목
			Cs cs2 = css.getTitle(cs);
			// re_step과 re_level 원글과 구별하기 위해 + 1
			cs.setCs_re_level(cs.getCs_re_level() + 1);
			cs.setCs_re_step(cs.getCs_re_step() + 1);
			cs.setCs_num(number);
			result = css.insert(cs);
			result = css.updateCon(cs.getCs_ref());
			cs.setCs_title(cs2.getCs_title());
			cs.setM_num(cs2.getM_num());
			css.csAlert(cs);
			List<Alert> alert = css.alertCon(cs.getM_num());
			session.removeAttribute("alert");
			session.setAttribute("alert", alert);
		} else {
			cs.setCs_ref(number); // 답변글이 아닐때는 num과 ref는 둘다 number
			cs.setCs_num(number);
			result = css.insert(cs);
		}
		
		
			
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "cs/csInsert";
	}
	
	@RequestMapping("cs/csView")
	public String csView(Cs cs, String pageNum, Model model, HttpServletRequest request) {
		int cs_num = cs.getCs_num();
		css.updateViewcount(cs_num);  // 조회수 증가
		Cs cs2 = css.select(cs_num); // 조회
		
		int m_num = cs2.getM_num();
		Member member = css.selectM(m_num);
		
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(27, 33);
		model.addAttribute("prevUrl", prevUrl);
		model.addAttribute("member",member);
		model.addAttribute("pageNum", pageNum);		
		model.addAttribute("cs", cs2);
		
		return "cs/csView";
	}
	
	@RequestMapping("cs/csDelete")
	public String csDelete(int cs_ref, String pageNum, Model model) {
		int result = css.delete(cs_ref);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		
		return "cs/csDelete";
	}
}
