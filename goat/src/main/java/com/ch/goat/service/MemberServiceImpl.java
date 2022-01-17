package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.MemberDao;
import com.ch.goat.model.Alert;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;
import com.ch.goat.model.Trip;

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

	@Override
	public String photo(String m_id) {
		return md.photo(m_id);
	}

	@Override
	public List<TempPlace> cpList(int m_num) {
		return md.place(m_num);
	}

	@Override
	public int cpDelete(int temp_num) {
		return md.cpDelete(temp_num);
	}

	@Override
	public List<Integer> bmNum(int m_num) {
		return md.bmNum(m_num);
	}

	@Override
	public List<Place> bookmarkList(int temp) {
		return md.bookmarkList(temp);
	}

	@Override
	public List<Cs> myCsList(int m_num) {
		return md.myCsList(m_num);
	}

	@Override
	public List<Alert> confirm(int m_num) {
		return md.confirm(m_num);
	}

	@Override
	public List<Schedule> myScList(int m_num) {
		return md.myScList(m_num);
	}

	@Override
	public List<Trip> myTripList(int m_num) {
		return md.myTripList(m_num);
	}

}
