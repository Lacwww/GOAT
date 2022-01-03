package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.Place;

public interface PlaceDao {

	int getPlaceNum();

	void insertAPI(Place place);

	int getTotal(Place place);

	List<Place> list(Place place, int startRow, int endRow);

}
