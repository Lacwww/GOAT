package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;

public interface AdminService {

	int getTotalPlace();

	List<Place> placeList(int startRow, int endRow);

	int getTotalSchedule();

	List<Schedule> scheduleList(int startRow, int endRow);

	int getTotalMember();

	List<Member> memberList(int startRow, int endRow);

}