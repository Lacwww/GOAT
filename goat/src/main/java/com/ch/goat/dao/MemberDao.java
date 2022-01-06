package com.ch.goat.dao;

import com.ch.goat.model.Member;

public interface MemberDao {

	Member select(String m_id);

	Member nickChk(Member member);

	Member emailChk(Member member);

	int insert(Member member);

	Member findId(Member member);

	Member findPass(Member member);

	int updatePass(Member member);

	int update(Member member);
}
