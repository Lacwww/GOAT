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
	@RequestMapping("main.do")
	public String main() {
		return "main";
	}
}
