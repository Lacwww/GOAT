package com.ch.goat.service;

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

	List<Schedule> schList(int m_num);

	Schedule selectSch(int sch_num);

	List<ScheduleDetail> selectScd(int sch_num);

	String selectArea(int place_num);

	List<Place> placeList(int sch_num);

	int updateSch(Schedule sch);

	void deleteScd(int sch_num);

}
