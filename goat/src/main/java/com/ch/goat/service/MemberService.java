package com.ch.goat.service;

import com.ch.goat.model.Member;

public interface MemberService {

	Member select(String m_id);

	Member nickChk(String m_nick);

	Member emailChk(String m_email);

	int insert(Member member);
	
}
