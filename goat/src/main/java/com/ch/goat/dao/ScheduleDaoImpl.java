package com.ch.goat.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
	public Place selectP(int id) {
		return sst.selectOne("schedulens.pick_place",id);
	}
	public int days(String s_date, String e_date) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_date", s_date);
		map.put("e_date", e_date);
		return sst.selectOne("schedulens.days",map);
	}

}
