package com.ch.goat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("member/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
}
