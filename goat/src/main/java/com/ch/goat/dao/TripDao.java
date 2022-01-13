package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Notice;
import com.ch.goat.model.Trip;

public interface TripDao {

	int getTotal(Trip trip);

	List<Trip> list(int startRow, int endRow);
//
//	int maxNum();
//
//	int insert(Notice notice);
//
//	void updateViewcount(int no_num);
//
//	Notice select(int no_num);
//
//	int delete(int no_num);
//
//	int update(Notice notice);

}