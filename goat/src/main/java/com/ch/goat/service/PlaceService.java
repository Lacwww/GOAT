package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Place;
import com.ch.goat.model.PlaceReview;
import com.ch.goat.model.TempPlace;

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

	void updatePrev(PlaceReview prev);

	List<Place> areaDetailList(String place_area);

	int tempinsert(TempPlace tempplace);

	Place selectPlace(int num);

	int tempUpdate(TempPlace tempplace);

	TempPlace selectTemp(int temp_num);

	int deleteTempPlace(int temp_num);

	int insertPlace(TempPlace tp);

	void approveTemp(int num);

	int updatePlace(TempPlace tempplace);

	int updateSuggestion(TempPlace tempplace);

	void tpAlert(TempPlace tempplace2);

	List<Alert> alertCon(int m_num);

	int adminPlaceInsert(Place place);

	int adminPlaceUpdate(Place place);











}
