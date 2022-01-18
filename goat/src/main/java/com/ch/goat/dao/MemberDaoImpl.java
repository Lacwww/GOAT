package com.ch.goat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;
import com.ch.goat.model.Trip;

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

	@Override
	public String photo(String m_id) {
		return sst.selectOne("memberns.photo", m_id);
	}

	@Override
	public List<TempPlace> place(int m_num) {
		return sst.selectList("memberns.cpList", m_num);
	}

	@Override
	public int cpDelete(int temp_num) {
		return sst.update("memberns.cpDelete", temp_num);
	}

	@Override
	public List<Integer> bmNum(int m_num) {
		return sst.selectList("memberns.bmNum", m_num);
	}

	@Override
	public List<Place> bookmarkList(int temp) {
		return sst.selectList("memberns.bookmarkList", temp);
	}

	@Override
	public List<Cs> myCsList(int m_num) {
		return sst.selectList("memberns.myCsList", m_num);
	}

	@Override
	public List<Alert> confirm(int m_num) {
		return sst.selectList("memberns.confirm", m_num);
	}

	@Override
	public List<Schedule> myScList(int m_num) {
		return sst.selectList("memberns.myScList", m_num);
	}

	@Override
	public List<Trip> myTripList(int m_num) {
		return sst.selectList("memberns.myTripList", m_num);
	}

	@Override
	public Member selectM_num(int m_num) {
		return sst.selectOne("memberns.selectM_num", m_num);
	}

	@Override
	public void alertCs(int ale_num) {
		sst.delete("memberns.alertCs", ale_num);
	}
}
