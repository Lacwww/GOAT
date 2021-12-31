package com.ch.goat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.PlaceDao;

@Service
public class PlaceServiceImpl implements PlaceService{
	@Autowired
	private PlaceDao pd;

	public int getPlaceNum() {
		return pd.getPlaceNum();
	}
}
