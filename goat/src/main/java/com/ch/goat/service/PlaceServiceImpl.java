package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.PlaceDao;
import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Place;
import com.ch.goat.model.PlaceReview;

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
	public float avgScore(int num) {
		return pd.avgScore(num);
	}
	public List<PlaceReview> prevList(int num) {
		return pd.prevList(num);
	}
	public Bookmark bookMarkChk(String id, int num) {
		return pd.bookMarkChk(id, num);
	}
	public void deleteBM(String id, int num) {
		pd.deleteBM(id, num);
	}
	public void insertBM(String id, int num) {
		pd.insertBM(id, num);
	}
	public void insertPrev(PlaceReview prev) {
		pd.insertPrev(prev);
	}
	public void deletePrev(PlaceReview prev) {
		pd.deletePrev(prev);
	}
	public void updatePrev(PlaceReview prev) {
		pd.updatePrev(prev);
	}
	public List<Place> areaDetailList(String place_area) {
		return pd.areaDetailList(place_area);
	}

}
