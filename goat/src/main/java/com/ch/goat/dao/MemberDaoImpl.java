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
	public Member nickChk(Member member) {
		return sst.selectOne("memberns.nickChk", member);
	}

	@Override
	public Member emailChk(Member member) {
		return sst.selectOne("memberns.emailChk", member);
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

	@Override
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}

	@Override
	public int delete(String m_id) {
		return sst.update("memberns.delete", m_id);
	}
}
