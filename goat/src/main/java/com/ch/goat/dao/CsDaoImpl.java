package com.ch.goat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;

@Repository
public class CsDaoImpl implements CsDao{
	@Autowired
	private SqlSessionTemplate sst;

	public List<Cs> list(Cs cs) {
		return sst.selectList("csns.list", cs);
	}
	
	public int getTotal(Cs cs) {
		return sst.selectOne("csns.getTotal", cs);
	}

	public Cs select(int num) {
		return sst.selectOne("csns.select", num);
	}

	public int maxNum() {
		return sst.selectOne("csns.maxNum");
	}

	public void updateStep(Cs cs) {
		sst.update("csns.updateStep", cs);
	}

	public int insert(Cs cs) {
		return sst.insert("csns.insert", cs);
	}

	public Member selectM(int m_num) {
		return sst.selectOne("csns.selectM", m_num);
	}
}
