package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;

public interface AdminDao {

	int getTotalPlace(String cate);

	List<Place> placeList(int startRow, int endRow);

	int getTotalSchedule();

	List<Schedule> scheduleList(int startRow, int endRow);

	int getTotalMember();

	List<Member> memberList(int startRow, int endRow);

	int getTotalTempPlace();

	List<TempPlace> tempPlaceList(int startRow, int endRow);

	List<Place> getCateList();
}