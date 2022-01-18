package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Trip;
import com.ch.goat.model.TripLike;

public interface TripDao {

	int getTotal(Trip trip);

	List<Trip> list(int startRow, int endRow);

	int maxNum();

	int insert(Trip trip);

	void updateViewcount(int t_num);

	Trip select(int t_num);
	
	int delete(int no_num);

	int update(Trip trip);

	TripLike tLike(String m_id, int t_num);

	void deleteTL(String m_id, int t_num);

	void insertTL(String m_id, int t_num);

	int tlCnt(int t_num);

	int getSearchTotal(String search, String keyword);

	List<Trip> searchList(Trip trip);

}