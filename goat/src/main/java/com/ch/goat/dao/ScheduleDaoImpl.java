package com.ch.goat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Area;

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
}
