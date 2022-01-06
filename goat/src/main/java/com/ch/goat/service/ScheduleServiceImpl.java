package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.ScheduleDao;
import com.ch.goat.model.Area;
import com.ch.goat.model.Place;

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
}
