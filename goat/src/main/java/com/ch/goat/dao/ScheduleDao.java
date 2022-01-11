package com.ch.goat.dao;

import java.sql.Date;
import java.util.List;

import com.ch.goat.model.Area;
import com.ch.goat.model.Place;

public interface ScheduleDao {

	List<Area> list();

	Area select(String place_area);

	List<Place> plist(Place place);

	Place selectP(int id);

	int days(String s_date, String e_date);

}
  