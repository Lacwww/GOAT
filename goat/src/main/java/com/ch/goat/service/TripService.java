package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Trip;

public interface TripService {

	int getTotal(Trip trip);

	List<Trip> list(int startRow, int endRow);

	int maxNum();

	int insert(Trip trip);

	void updateViewcount(int t_num);

	Trip select(int t_num);
	
	int delete(int t_num);

	int update(Trip trip);

}