package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;

public interface CsDao {

	int getTotal(Cs cs);

	Cs select(int num);

	int maxNum();

	void updateStep(Cs cs);

	int insert(Cs cs);

	Member selectM(int m_num);

	List<Cs> list(int startRow, int endRow);

	void updateViewcount(int cs_num);

	int delete(int cs_ref);
}
