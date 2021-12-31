package com.ch.goat.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceDaoImpl implements PlaceDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int getPlaceNum() {
		return sst.selectOne("placens.getPlaceNum");
	}
}
