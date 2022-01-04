package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.PlaceDao;
import com.ch.goat.model.Place;

@Service
public class PlaceServiceImpl implements PlaceService{
	@Autowired
	private PlaceDao pd;

	public int getPlaceNum() {
		return pd.getPlaceNum();
	}
	public void insertAPI(Place place) {
		pd.insertAPI(place);
	}
	public int getTotal(Place place) {
		return pd.getTotal(place);
	}
	public List<Place> list(Place place, int startRow, int endRow) {
		return pd.list(place, startRow, endRow);
	}
	public Place placeModal(int num) {
		return pd.placeModal(num);
	}

}
