package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;

public interface CsDao {

	List<Cs> list(Cs cs);

	int getTotal(Cs cs);

	Cs select(int num);

	int maxNum();

	void updateStep(Cs cs);

	int insert(Cs cs);

	Member selectM(int m_num);
}
