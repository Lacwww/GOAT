package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Member;
import com.ch.goat.model.Trip;
import com.ch.goat.model.TripLike;
import com.ch.goat.service.MemberService;

@Repository
public class TripDaoImpl implements TripDao {
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private MemberService ms;

	public int getTotal(Trip trip) {
		return sst.selectOne("tripns.getTotal", trip);
	}

	public List<Trip> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("tripns.list", map);
	}

	public int maxNum() {
		return sst.selectOne("tripns.maxNum");
	}

	public int insert(Trip trip) {
		return sst.insert("tripns.insert", trip);
	}

	public void updateViewcount(int t_num) {
		sst.update("tripns.updateViewcount", t_num);
	}

	public Trip select(int t_num) {
		return sst.selectOne("tripns.select", t_num);
	}

	public int delete(int t_num) {
		return sst.update("tripns.delete", t_num);
	}

	public int update(Trip trip) {
		return sst.update("tripns.update", trip);
	}

	public TripLike tLike(String m_id, int t_num) {
		Member member = ms.select(m_id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", member.getM_num());
		map.put("t_num", t_num);
		return sst.selectOne("tripns.tLike", map);
	}

	public void deleteTL(String m_id, int t_num) {
		Member member = ms.select(m_id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", member.getM_num());
		map.put("t_num", t_num);
		sst.delete("tripns.deleteTL", map);
	}

	public void insertTL(String m_id, int t_num) {
		Member member = ms.select(m_id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", member.getM_num());
		map.put("t_num", t_num);
		sst.insert("tripns.insertTL", map);
	}

	public int tlCnt(int t_num) {
		return sst.selectOne("tripns.tlCnt", t_num);
	}

	public int getSearchTotal(String search, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		return sst.selectOne("tripns.getSearchTotal", map);
	}

	public List<Trip> searchList(Trip trip) {
		return sst.selectList("tripns.searchList", trip);
	}

	
}