package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Area;

public interface ScheduleService {

	List<Area> list();

	Area select(String place_area);

}
