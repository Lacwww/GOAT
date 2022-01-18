package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;
import com.ch.goat.model.Trip;

public interface MemberService {

	Member select(String m_id);

	Member nickChk(Member member);

	Member emailChk(Member member);

	int insert(Member member);

	Member findId(Member member);

	Member findPass(Member member);

	int updatePass(Member member);

	int update(Member member);

	int delete(String m_id);

	String photo(String m_id);

	List<TempPlace> cpList(int m_num);

	int cpDelete(int temp_num);

	List<Integer> bmNum(int m_num);

	List<Place> bookmarkList(int temp);

	List<Cs> myCsList(int m_num);

	List<Alert> confirm(int m_num);

	List<Schedule> myScList(int m_num);

	List<Trip> myTripList(int m_num);

	Member selectM_num(int m_num);

	void alertTp(int ale_num);
	
	void alertCs(int ale_num);

}
