package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.CsDao;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;

@Service
public class CsServiceImpl implements CsService{
	@Autowired
	private CsDao cd;
	
	public int getTotal(Cs cs) {
		return cd.getTotal(cs);
	}
	public Cs select(int num) {
		return cd.select(num);
	}
	public int maxNum() {
		return cd.maxNum();
	}
	public void updateStep(Cs cs) {
		cd.updateStep(cs);
	}
	public int insert(Cs cs) {
		return cd.insert(cs);
	}
	public Member selectM(int m_num) {
		return cd.selectM(m_num);
	}
	public List<Cs> list(int startRow, int endRow) {
		return cd.list(startRow, endRow);
	}
	public void updateViewcount(int cs_num) {
		cd.updateViewcount(cs_num);
	}
}
