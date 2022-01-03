package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Area;

public interface ScheduleDao {

	List<Area> list();

	Area select(String place_area);

}
