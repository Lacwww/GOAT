package com.ch.goat.dao;

import com.ch.goat.model.Member;

public interface MemberDao {

	Member select(String m_id);

	Member nickChk(String m_nick);

	Member emailChk(String m_email);

	int insert(Member member);
}
