package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Area;
import com.ch.goat.model.Place;

public interface ScheduleService {

	List<Area> list(); 

	Area select(String place_area);  

	List<Place> plist(Place place);

	Place selectP(int id);

}
