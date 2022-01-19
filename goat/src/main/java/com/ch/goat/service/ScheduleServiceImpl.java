package com.ch.goat.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.ScheduleDao;
import com.ch.goat.model.Alert;
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

	public void schAlert(Schedule sch) {
		sd.schAlert(sch);
	}

	public List<Alert> alertCon(int m_num) {
		return sd.alertCon(m_num);
	}

	public List<Schedule> schList(int m_num) {
		return sd.schList(m_num);
	}

	public Schedule selectSch(int sch_num) {
		return sd.selectSch(sch_num);
	}

	public List<ScheduleDetail> selectScd(int sch_num) {
		return sd.selectScd(sch_num);
	}

	public String selectArea(int place_num) {
		return sd.selectArea(place_num);
	}
}
