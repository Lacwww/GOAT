package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;


@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotalPlace(String cate, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("search", search);
		return sst.selectOne("adminns.getTotalPlace", map);
	}

	@Override
	public List<Place> placeList(int startRow, int endRow, String cate, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("cate", cate);
		map.put("search", search);
		return sst.selectList("adminns.placeList", map);
	}

	@Override
	public int getTotalSchedule() {
		return sst.selectOne("adminns.getTotalSchedule");
	}

	@Override
	public List<Schedule> scheduleList(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("adminns.scheduleList", map);
	}

	@Override
	public int getTotalMember() {
		return sst.selectOne("adminns.getTotalMember");
	}

	@Override
	public List<Member> memberList(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("adminns.memberList", map);
	}

	@Override
	public int getTotalTempPlace() {
		return sst.selectOne("adminns.getTotalTempPlace");
	}

	@Override
	public List<TempPlace> tempPlaceList(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("adminns.tempPlaceList", map);
	}

	@Override
	public List<Place> getCateList() {	
		return sst.selectList("adminns.getCateList");
	}

}