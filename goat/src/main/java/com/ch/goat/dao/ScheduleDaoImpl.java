package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Area;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.ScheduleDetail;

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

	public List<Place> plist(Place place) {  
		return sst.selectList("schedulens.placeList",place);
	}
	public Place selectP(int id) {
		return sst.selectOne("schedulens.pick_place",id);
	}
	public int days(String s_date, String e_date) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_date", s_date);
		map.put("e_date", e_date);
		return sst.selectOne("schedulens.days",map);
	}
	public int insert(Schedule sch) {
		return sst.insert("schedulens.insert",sch);
	}
	public void insertDetail(ScheduleDetail scd) {
		sst.insert("schedulens.insertDetail",scd);
	}

	public int select_num() {
		return sst.selectOne("schedulens.select_num");
	}

	public void schAlert(Schedule sch) {
		sst.insert("schedulens.schAlert", sch);
	}

	public List<Alert> alertCon(int m_num) {
		return sst.selectList("schedulens.alertCon", m_num);
	}

	public List<Schedule> schList(int m_num) {
		return sst.selectList("schedulens.schList",m_num);
	}

	public Schedule selectSch(int sch_num) {
		return sst.selectOne("schedulens.selectSch",sch_num);
	}

	public List<ScheduleDetail> selectScd(int sch_num) {
		return sst.selectList("schedulens.selectScd",sch_num);
	}

	public String selectArea(int place_num) {
		return sst.selectOne("schedulens.selectArea",place_num);
	}

	public List<Place> placeList(int sch_num) {
		return sst.selectList("schedulens.updateSchList",sch_num);
	}

	public int updateSch(Schedule sch) {
		return sst.update("schedulens.updateSch",sch);
	}
	public void deleteScd(int sch_num) {
		sst.delete("schedulens.deleteScd",sch_num);
	}
	public void deleteSch(int sch_num) {
		sst.delete("schedulens.deleteSch",sch_num);
	}


}
