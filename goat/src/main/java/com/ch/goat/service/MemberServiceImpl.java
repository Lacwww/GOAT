package com.ch.goat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.MemberDao;
import com.ch.goat.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	@Override
	public Member select(String m_id) {
		return md.select(m_id);
	}

	@Override
	public Member nickChk(String m_nick) {
		return md.nickChk(m_nick);
	}

	@Override
	public Member emailChk(String m_email) {
		return md.emailChk(m_email);
	}

	@Override
	public int insert(Member member) {
		return md.insert(member);
	}

}
