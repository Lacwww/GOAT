package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Trip;
import com.ch.goat.model.TripLike;

public interface TripService {

	int getTotal(Trip trip);

	List<Trip> list(int startRow, int endRow);

	int maxNum();

	int insert(Trip trip);

	void updateViewcount(int t_num);

	Trip select(Trip trip);
	
	int delete(int t_num);

	int update(Trip trip);

	TripLike tLike(String m_id, int t_num);

	void deleteTL(String m_id, int t_num);

	void insertTL(String m_id, int t_num);

	int tlCnt(int t_num);

	List<Trip> searchList(Trip trip);

	int getSearchTotal(Trip trip);

	List<Trip> hotLike(Trip trip);

	String getTitle(int num);

	void trAlert(Alert ale);

	List<Alert> alertCon(int m_num);

}