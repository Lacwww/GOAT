package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Place;
import com.ch.goat.model.PlaceReview;

public interface PlaceService {

	int getPlaceNum();

	void insertAPI(Place place);

	int getTotal(Place place);

	List<Place> list(Place place, int startRow, int endRow);

	Place placeModal(int num);

	float avgScore(int num);

	List<PlaceReview> prevList(int num);

	Bookmark bookMarkChk(String id, int num);

	void deleteBM(String id, int num);

	void insertBM(String id, int num);

	void insertPrev(PlaceReview prev);

	void deletePrev(PlaceReview prev);





}
