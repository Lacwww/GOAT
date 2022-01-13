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
//	public int maxNum() {
//		return nd.maxNum();
//	}
//	public int insert(Notice notice) {
//		return nd.insert(notice);
//	}
//	public void updateViewcount(int no_num) {
//		nd.updateViewcount(no_num);
//	}
//	public Notice select(int no_num) {
//		return nd.select(no_num);
//	}
//	public int delete(int no_num) {
//		return nd.delete(no_num);
//	}
//	public int update(Notice notice) {
//		return nd.update(notice);
//	}
	
}