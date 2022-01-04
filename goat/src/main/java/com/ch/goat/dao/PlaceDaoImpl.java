package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Place;

@Repository
public class PlaceDaoImpl implements PlaceDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	public int getPlaceNum() {
		return sst.selectOne("placens.getPlaceNum");
	}
	public void insertAPI(Place place) {
		sst.insert("placens.insertAPI", place);
	}
	public int getTotal(Place place) {
		return sst.selectOne("placens.getTotal", place);
	}
	public List<Place> list(Place place, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("place_area", place.getPlace_area());
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("placens.list", map);
	}
}
