package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Place;

public interface PlaceService {

	int getPlaceNum();

	void insertAPI(Place place);

	int getTotal(Place place);

	List<Place> list(Place place, int startRow, int endRow);

	Place placeModal(int num);

	float avgScore(int num);


}
