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
	public Member nickChk(Member member) {
		return md.nickChk(member);
	}

	@Override
	public Member emailChk(Member member) {
		return md.emailChk(member);
	}

	@Override
	public int insert(Member member) {
		return md.insert(member);
	}

	@Override
	public Member findId(Member member) {
		return md.findId(member);
	}

	@Override
	public Member findPass(Member member) {
		return md.findPass(member);
	}

	@Override
	public int updatePass(Member member) {
		return md.updatePass(member);
	}

	@Override
	public int update(Member member) {
		return md.update(member);
	}

	@Override
	public int delete(String m_id) {
		return md.delete(m_id);
	}

}
