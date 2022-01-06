package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Area;
import com.ch.goat.model.Place;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	@Autowired
	private SqlSessionTemplate sst;

	public List<Area> list() {
		return sst.selectList("schedulens.areaList");
	}

	public Area select(String place_area) {
		return sst.selectOne("schedulens.areaSelect",place_area);
	}

	public List<Place> plist(Place place) {  
		return sst.selectList("schedulens.placeList",place);
	}

}
