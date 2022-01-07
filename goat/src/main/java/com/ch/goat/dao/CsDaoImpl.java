package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;

@Repository
public class CsDaoImpl implements CsDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	public int getTotal(Cs cs) {
		return sst.selectOne("csns.getTotal", cs);
	}

	public Cs select(int cs_num) {
		return sst.selectOne("csns.select", cs_num);
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
	
	public List<Cs> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("csns.list", map);
	}

	public void updateViewcount(int cs_num) {
		sst.update("csns.updateViewcount", cs_num);
	}

	public int delete(int cs_ref) {
		return sst.update("csns.delete", cs_ref);
	}

}
