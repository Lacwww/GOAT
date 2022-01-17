package com.ch.goat.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.ScheduleDao;
import com.ch.goat.model.Area;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.ScheduleDetail;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDao sd;

	@Override
	public List<Area> list() {
		return sd.list();   
	} 

	public Area select(String place_area) {
		return sd.select(place_area);
	}

	public List<Place> plist(Place place) {
		return sd.plist(place);
	}

	public Place selectP(int id) {
		return sd.selectP(id);
	}

	public int days(String s_date, String e_date) {
		return sd.days(s_date,e_date);
	}

	public int insert(Schedule sch) {
		return sd.insert(sch);
	}
	public void insertDetail(ScheduleDetail scd) {
		sd.insertDetail(scd);
	}

	public int select_num() {
		return sd.select_num();
	}
}
