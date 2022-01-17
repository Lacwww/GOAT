package com.ch.goat.service;

import java.sql.Date;
import java.util.List;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Area;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.ScheduleDetail;

public interface ScheduleService {

	List<Area> list();

	Area select(String place_area);

	List<Place> plist(Place place);

	Place selectP(int id);

	int days(String s_date, String e_date);

	int insert(Schedule sch);

	void insertDetail(ScheduleDetail scd);

	int select_num();

	void schAlert(Schedule sch);

	List<Alert> alertCon(int m_num);

}
