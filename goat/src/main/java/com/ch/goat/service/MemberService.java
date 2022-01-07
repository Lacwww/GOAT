package com.ch.goat.service;

import com.ch.goat.model.Member;

public interface MemberService {

	Member select(String m_id);

	Member nickChk(Member member);

	Member emailChk(Member member);

	int insert(Member member);

	Member findId(Member member);

	Member findPass(Member member);

	int updatePass(Member member);

	int update(Member member);

	int delete(String m_id);

	String photo(String m_id);
	
}
