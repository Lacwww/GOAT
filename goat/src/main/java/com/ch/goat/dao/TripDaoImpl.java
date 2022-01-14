package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Trip;

@Repository
public class TripDaoImpl implements TripDao {
	@Autowired
	private SqlSessionTemplate sst;

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
}