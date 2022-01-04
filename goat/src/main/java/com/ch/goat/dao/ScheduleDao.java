package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Area;
import com.ch.goat.model.Place;

public interface ScheduleDao {

	List<Area> list();

	Area select(String place_area);

	List<Place> plist(String place_area);

}
