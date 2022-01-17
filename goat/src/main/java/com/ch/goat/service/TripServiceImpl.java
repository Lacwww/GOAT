package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.TripDao;
import com.ch.goat.model.Trip;

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
	public Trip select(int t_num) {
		return td.select(t_num);
	}
	public int delete(int t_num) {
		return td.delete(t_num);
	}
	public int update(Trip trip) {
		return td.update(trip);
	}
	
}