package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Notice;
import com.ch.goat.model.Trip;

public interface TripDao {

	int getTotal(Trip trip);

	List<Trip> list(int startRow, int endRow);

	int maxNum();

	int insert(Trip trip);

	void updateViewcount(int t_num);

	Trip select(int t_num);
	
	int delete(int no_num);

	int update(Trip trip);

}