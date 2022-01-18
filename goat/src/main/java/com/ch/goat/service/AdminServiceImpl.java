package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.AdminDao;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao ad;

	@Override
	public int getTotalPlace(String cate, String search) {
		return ad.getTotalPlace(cate, search);
	}

	@Override
	public List<Place> placeList(int startRow, int endRow, String cate, String search) {
		return ad.placeList(startRow, endRow, cate, search);
	}

	@Override
	public int getTotalSchedule() {
		return ad.getTotalSchedule();
	}


	@Override
	public List<Schedule> scheduleList(int startRow, int endRow) {
		return ad.scheduleList(startRow, endRow);
	}
	
	@Override
	public int getTotalMember() {
		return ad.getTotalMember();
	}
	
	@Override
	public List<Member> memberList(int startRow, int endRow) {
		return ad.memberList(startRow, endRow);
	}

	@Override
	public int getTotalTempPlace() {
		return ad.getTotalTempPlace();
	}

	@Override
	public List<TempPlace> tempPlaceList(int startRow, int endRow) {
		return ad.tempPlaceList(startRow, endRow);
	}

	@Override
	public List<Place> getCateList() {
		return ad.getCateList();
	}
}