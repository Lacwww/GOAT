package com.ch.goat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;
import com.ch.goat.service.CsService;
import com.ch.goat.service.PageBean;

@Controller
public class CsController {
	@Autowired
	private CsService css;
	
	@RequestMapping("csList")
	public String csList(Cs cs, String pageNum, Model model) {
		int m_num;
		int  rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = css.getTotal(cs);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
//		css.setStartRow(startRow);
//		css.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		List<Cs> list = css.list(cs);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		// 답변글로 인한 번호를 보기좋게 다시 설정
		int no = total - startRow + 1;
		
		m_num = 1;
		Member member = css.selectM(m_num);
		
		model.addAttribute("member",member);
		
		model.addAttribute("cs", cs);
		model.addAttribute("no", no);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		return "cs/csList";
	}
	
	@RequestMapping("csInsertForm")
	public String csInsertForm(int num, String pageNum, Model model) {
			// ref 답변글끼리 뭉칠때, re_level 들여쓰기, re_step 답변글 순서
			int ref = 0, re_level = 0, re_step = 0;
			int m_num;
			
			if(num != 0) {
				Cs cs = css.select(num);
				ref = cs.getCs_ref();
				re_step = cs.getCs_re_step();
				re_level = cs.getCs_re_level();
			}
			
			m_num = 1;
			Member member = css.selectM(m_num);
			
			model.addAttribute("member",member);
			model.addAttribute("num", num);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("ref", ref);
			model.addAttribute("re_level", re_level);
			model.addAttribute("re_step", re_step);
		return "cs/csInsertForm";
	}
	
	@RequestMapping("csInsert")
	public String csInsert(Cs cs, String pageNum, Model model) {
			int number = css.maxNum(); // 새 게시글 번호 생성
			if(cs.getNum() != 0) { // 답변글
				// 글을 읽고 ref가 같고, re_step이 읽은 글의 re_step보다 크면 그 글의 re_step+1
				css.updateStep(cs);
				// re_step과 re_level은 읽은 값 더하기 1
				cs.setCs_re_level(cs.getCs_re_level() + 1);
				cs.setCs_re_step(cs.getCs_re_step() + 1);
			} else cs.setCs_ref(number); // 답변글이 아닐때는 num과 ref는 둘다 number
			cs.setNum(number);
			int result = css.insert(cs);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("result", result);

		return "cs/csInsert";
	}
}
