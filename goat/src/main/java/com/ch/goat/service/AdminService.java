package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;

public interface AdminService {

	int getTotalPlace(String cate, String search);

	List<Place> placeList(int startRow, int endRow, String cate, String search);

	int getTotalSchedule();

	List<Schedule> scheduleList(int startRow, int endRow);

	int getTotalMember();

	List<Member> memberList(int startRow, int endRow);

	int getTotalTempPlace();

	List<TempPlace> tempPlaceList(int startRow, int endRow);

	List<Place> getCateList();

}