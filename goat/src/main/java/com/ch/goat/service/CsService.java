package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;

public interface CsService {
	
	int getTotal(Cs cs);

	Cs select(int cs_num);

	int maxNum();

	int insert(Cs cs);

	Member selectM(int m_num);

	List<Cs> list(int startRow, int endRow);

	void updateViewcount(int cs_num);

	int delete(int cs_ref);

	int updateCon(int cs_ref);

	void csAlert(Cs cs);
	
	Cs getTitle(Cs cs);

	List<Alert> alertCon(int m_num);

}
