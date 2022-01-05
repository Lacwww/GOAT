package com.ch.goat.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.goat.model.Member;
import com.ch.goat.service.MemberService;
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bpPass;
	@RequestMapping("main/main")
	public String main() {
		return "main/main";
	}
	@RequestMapping("main/home")
	public String home() {
		return "main/home";
	}
	@RequestMapping("member/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	@RequestMapping(value = "member/chkId", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkId(String m_id, Model model) {
		String msg = "";
		Member member = ms.select(m_id);
		if(member == null) msg = "0";
		else msg = "1";
		return msg;
	}
	@RequestMapping(value = "member/chkNick", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkNick(String m_nick, Model model) {
		String msg = "";
		Member member = ms.nickChk(m_nick);
		if(member == null) msg = "0";
		else msg = "1";
		return msg;
	}
	@RequestMapping(value = "member/chkEmail", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkEmail(String m_email, Model model) {
		String msg = "";
		Member member = ms.emailChk(m_email);
		if(member == null) msg = "0";
		else msg = "1";
		return msg;
	}
	@RequestMapping("member/join")
	public String join(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// 화면에서 입력한 데이터가 있는지 확인 member = 화면에서 입력한 데이터 member2 = db에서 읽어온 데이터
		Member member2 = ms.select(member.getM_id());
		if (member2 == null) {
			// 실제 파일명
			String fileName1 = member.getFile().getOriginalFilename();
			// 실제 파일 저장 경로
			String real = session.getServletContext().getRealPath("/resources/m_photo");
			// 파일명을 변경해야 할 때 : UUID 임의의 문자열로 변경 Mac은 파일명이 한글이면 깨짐
			UUID uuid = UUID.randomUUID();
			String fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
			// 파일 저장			
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
			// 입력한 암호를 암호화 한 후 다시 db에 저장
			String pass = bpPass.encode(member.getM_pass());
			member.setM_pass(pass);
			member.setM_photo(fileName);
			result = ms.insert(member);
		} else result = -1; // 이미 있는 데이터
		model.addAttribute("result", result);
		return "member/join";
	}
	@RequestMapping("member/loginForm")
	public String loginForm(HttpServletRequest request, Model model) {
		String prevUrl = request.getHeader("Referer");
		System.out.println(prevUrl);
		prevUrl = prevUrl.substring(21);
		System.out.println("prev:"+prevUrl);
		model.addAttribute("prevUrl", prevUrl);
		return "member/loginForm";
	}
	@RequestMapping("member/login")
	public String login(Member member, Model model, String prevUrl, HttpSession session) {
		int result = 0; // 암호가 다름
		Member member2 = ms.select(member.getM_id());
		if (member2 == null || member2.getDel().equals("y")) {
			result = -1; // 없는 아이디
		} else {
//			if (member.getPassword().equals(member2.getPassword())) 암호화 되어있기 때문에 불가능
			if (bpPass.matches(member.getM_pass(), member2.getM_pass())) {
				result = 1; // 성공 id와 암호가 일치
				session.setAttribute("id", member.getM_id());
			}
		}
		model.addAttribute("result", result);
		model.addAttribute("prevUrl", prevUrl);
		return "member/login";
	}
	@RequestMapping("member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
}
