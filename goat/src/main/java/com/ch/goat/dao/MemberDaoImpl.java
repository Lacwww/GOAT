package com.ch.goat.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}

	@Override
	public Member nickChk(String m_nick) {
		return sst.selectOne("memberns.nickChk", m_nick);
	}

	@Override
	public Member emailChk(String m_email) {
		return sst.selectOne("memberns.emailChk", m_email);
	}

	@Override
	public Member select(String m_id) {
		return sst.selectOne("memberns.select", m_id);
	}

	@Override
	public Member findId(Member member) {
		return sst.selectOne("memberns.findId", member);
	}

	@Override
	public Member findPass(Member member) {
		return sst.selectOne("memberns.findPass", member);
	}

	@Override
	public int updatePass(Member member) {
		return sst.update("memberns.updatePass", member);
	}
}
