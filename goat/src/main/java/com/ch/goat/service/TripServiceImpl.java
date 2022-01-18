package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.TripDao;
import com.ch.goat.model.Trip;
import com.ch.goat.model.TripLike;

@Service
public class TripServiceImpl implements TripService{
	@Autowired
	private TripDao td;
	
	public int getTotal(Trip trip) {
		return td.getTotal(trip);
	}
	public List<Trip> list(int startRow, int endRow) {
		return td.list(startRow, endRow);
	}
	public int maxNum() {
		return td.maxNum();
	}
	public int insert(Trip trip) {
		return td.insert(trip);
	}
	public void updateViewcount(int t_num) {
		td.updateViewcount(t_num);
	}
	public Trip select(Trip trip) {
		return td.select(trip);
	}
	public int delete(int t_num) {
		return td.delete(t_num);
	}
	public int update(Trip trip) {
		return td.update(trip);
	}
	public TripLike tLike(String m_id, int t_num) {
		return td.tLike(m_id, t_num);
	}
	public void deleteTL(String m_id, int t_num) {
		td.deleteTL(m_id, t_num);
	}
	public void insertTL(String m_id, int t_num) {
		td.insertTL(m_id, t_num);
	}
	public int tlCnt(int t_num) {
		return td.tlCnt(t_num);
	}
	public List<Trip> searchList(Trip trip) {
		return td.searchList(trip);
	}
	public int getSearchTotal(Trip trip) {
		return td.getSearchTotal(trip);
	}
	
}