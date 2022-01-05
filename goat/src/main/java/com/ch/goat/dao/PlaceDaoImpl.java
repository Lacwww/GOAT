package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.PlaceReview;
import com.ch.goat.service.MemberService;

@Repository
public class PlaceDaoImpl implements PlaceDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private MemberService ms;
	
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
		map.put("keyword", place.getKeyword());
		return sst.selectList("placens.list", map);
	}
	public Place placeModal(int num) {
		return sst.selectOne("placens.placeModal", num);
	}
	public float avgScore(int num) {
		return sst.selectOne("placens.avgScore", num);
	}
	public List<PlaceReview> prevList(int num) {
		return sst.selectList("placens.prevList", num);
	}
	public Bookmark bookMarkChk(String id, int num) {
		Member member = ms.select(id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", member.getM_num());
		map.put("place_num", num);
		return sst.selectOne("placens.bookMarkChk", map);
	}
	public void deleteBM(String id, int num) {
		Member member = ms.select(id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", member.getM_num());
		map.put("place_num", num);
		sst.delete("placens.deleteBM", map);
	}
	public void insertBM(String id, int num) {
		Member member = ms.select(id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", member.getM_num());
		map.put("place_num", num);
		sst.insert("placens.insertBM", map);
	}
	public void insertPrev(PlaceReview prev) {
		sst.insert("placens.insertPrev", prev);
	}
	public void deletePrev(PlaceReview prev) {
		sst.update("placens.deletePrev", prev);
	}
}
