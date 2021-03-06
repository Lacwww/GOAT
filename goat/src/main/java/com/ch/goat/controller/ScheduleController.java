package com.ch.goat.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Area;
import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.ScheduleDetail;
import com.ch.goat.service.PlaceService;
import com.ch.goat.service.ScheduleService;
import com.sun.xml.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;
	@Autowired
	private PlaceService ps;
	
	@RequestMapping("schedule/NewFile")
	public String newFile() {
		return "schedule/NewFile";
	}
	@RequestMapping("schedule/selectArea")
	public String selectArea(Model model) {
		List<Area> list = ss.list();
		model.addAttribute("list", list);
		return "schedule/selectArea";
	}

	@RequestMapping("schedule/selectModal")
	public String selectModal(Model model, String place_area,HttpSession session) {
		String id=(String) session.getAttribute("m_id");
		Area area = ss.select(place_area);
		model.addAttribute("area", area);
		model.addAttribute("id", id);
		return "schedule/selectModal";
	}

	@RequestMapping("schedule/makeScheduleForm")
	public String makeScheduleForm(Model model, String place_area) {
		String[] t = { "장소명", "테마" };
		model.addAttribute("t", t);
		model.addAttribute("place_area", place_area);
		return "schedule/makeScheduleForm";
	}

	@RequestMapping("schedule/placeList")
	public String placeList(Model model, Place place, String search, String keyword) {
		place.setKeyword(keyword);
		place.setSearch(search);
		List<Place> plist = ss.plist(place);
		model.addAttribute("keyword", keyword);
		model.addAttribute("search", search);
		model.addAttribute("place", place);
		model.addAttribute("plist", plist);
		return "schedule/placeList";
	}

	@RequestMapping("schedule/makeScheduleDetail")
	public String makeScheduleDetail(Model model, Place place, String id, String s_date, String e_date,
			String place_area) {
		// place PK int로 형변환
		String[] ids = id.split(",");
		int[] place_num = new int[ids.length];
		for (int i = 0; i < ids.length; i++) {
			place_num[i] = Integer.parseInt(ids[i]);
		}
		List<Place> places = new ArrayList<Place>();
		for (int i = 0; i < place_num.length; i++) {
			place = ss.selectP(place_num[i]);
			places.add(place);
		}
		int days = ss.days(s_date, e_date);
		model.addAttribute("days", days);
		model.addAttribute("size", places.size());
		model.addAttribute("place_area", place_area);
		model.addAttribute("places", places);
		model.addAttribute("s_date", s_date);
		model.addAttribute("e_date", e_date);
		return "schedule/makeScheduleDetail";
	}

	@RequestMapping("schedule/insertSchedule")
	public String chkSchedule(Model model, String result_day, int days, HttpSession session, Date s_date, Date e_date,
			String sch_name) {
		int m_num = (Integer) session.getAttribute("m_num");
		Schedule sch = new Schedule();
		ScheduleDetail scd = new ScheduleDetail();
		sch.setS_date(s_date);
		sch.setE_date(e_date);
		sch.setM_num(m_num);
		sch.setSch_name(sch_name);
		int results=ss.insert(sch);
		int sch_num = ss.select_num();
		sch.setSch_num(sch_num);
		ss.schAlert(sch);
		List<Alert> alert = ss.alertCon(m_num);
		session.removeAttribute("alert");
		session.setAttribute("alert", alert);
		List<String> list = new ArrayList<String>();
		String[] result = result_day.split(",day");
		for (int i = 0; i < result.length; i++) {
			String[] arr = result[i].split(",");
			for (String s : arr) {
				if (s != null && s.length() > 0) {
					list.add(s);
				}
			}
			arr = list.toArray(new String[list.size()]);
			
			
			scd.setDay(i+1);
			scd.setSch_num(sch_num);
			//scd.set
			for(int k=0; k<arr.length; k++) {
				int pnum = Integer.parseInt(arr[k]);
				scd.setPlace_num(pnum);
				ss.insertDetail(scd);
			}
			list.clear();
		}
		model.addAttribute("results", results);
		model.addAttribute("m_num",m_num);
		model.addAttribute("sch_num",sch_num);
		return "schedule/insertSchedule";
	}
	@RequestMapping("schedule/schView")
	public String schView(Model model, HttpSession session,int sch_num ) {
		int m_num = (Integer) session.getAttribute("m_num");
		Schedule sch = ss.selectSch(sch_num);
		String s_date = DateFormatUtils.format(sch.getS_date(), "yyyy-MM-dd");
		String e_date = DateFormatUtils.format(sch.getE_date(), "yyyy-MM-dd");
		int days = ss.days(s_date,e_date);
		List<ScheduleDetail> list = ss.selectScd(sch_num); 
		String place_area = ss.selectArea(list.get(0).getPlace_num());
		
		model.addAttribute("sch_num",sch_num);
		model.addAttribute("place_area",place_area);
		model.addAttribute("days",days);
		model.addAttribute("sch",sch);
		model.addAttribute("list",list);
		model.addAttribute("m_num",m_num);

		return "schedule/schView";
	}
	@RequestMapping("schedule/updateSchForm")
	public String updateSch(Model model,int sch_num, HttpSession session) {
		Schedule sch = ss.selectSch(sch_num);
		List<ScheduleDetail> list = ss.selectScd(sch_num); 
		String place_area = ss.selectArea(list.get(0).getPlace_num());
		List<Place> plist = ss.placeList(sch_num);
		String[] t = { "장소명", "테마" };
		
		String[] places_num = new String[list.size()];
		String places_numS="";
		for(int i=0; i<list.size(); i++	) {
			places_num[i] = Integer.toString(list.get(i).getPlace_num());
			if(i < list.size()-1) {
				places_numS += places_num[i]+",";
			}else {
				places_numS += places_num[i];
			}
		}
		model.addAttribute("places_numS",places_numS);
		model.addAttribute("sch_num",sch_num);
		model.addAttribute("t", t);
		model.addAttribute("place_area", place_area);
		model.addAttribute("sch",sch);
		model.addAttribute("list",list);
		model.addAttribute("plist",plist);
		return "schedule/updateSchForm";
	}
	@RequestMapping("schedule/updateSchDetail")
	public String updateSchDetail(Model model, Place place, String id, String s_date, String e_date,
			String place_area, int sch_num) {
		// place PK int로 형변환
		String[] ids = id.split(",");
		int[] place_num = new int[ids.length];
		
		for (int i = 0; i < ids.length; i++) {
			place_num[i] = Integer.parseInt(ids[i]);
		}
		List<Place> places = new ArrayList<Place>();
		for (int i = 0; i < place_num.length; i++) {
			place = ss.selectP(place_num[i]);
			places.add(place);
		}
		Schedule sch = ss.selectSch(sch_num);
		
		int days = ss.days(s_date, e_date);
		model.addAttribute("sch",sch);
		model.addAttribute("sch_num",sch_num);
		model.addAttribute("days", days);
		model.addAttribute("size", places.size());
		model.addAttribute("place_area", place_area);
		model.addAttribute("places", places);
		model.addAttribute("s_date", s_date);
		model.addAttribute("e_date", e_date);
		return "schedule/updateSchDetail";
	}
	@RequestMapping("schedule/updateSch")
	public String updateSch(Model model, String result_day, int days, HttpSession session, Date s_date, Date e_date,
			String sch_name, int sch_num) {
		int m_num = (Integer) session.getAttribute("m_num");
		Schedule sch = new Schedule();
		sch.setS_date(s_date);
		sch.setE_date(e_date);
		sch.setM_num(m_num);
		sch.setSch_name(sch_name);
		sch.setSch_num(sch_num);
	
		ss.deleteScd(sch_num);
		ScheduleDetail scd = new ScheduleDetail();
		scd.setSch_num(sch_num);
		
		int results=ss.updateSch(sch);
		
		// 알람
		ss.updateSchAlert(sch);
		List<Alert> alert = ss.alertCon(m_num);
		session.removeAttribute("alert");
		session.setAttribute("alert", alert);
		List<String> list = new ArrayList<String>();

		String[] result = result_day.split(",day");
		for (int i = 0; i < result.length; i++) {
			String[] arr = result[i].split(",");
			for (String s : arr) {
				if (s != null && s.length() > 0) {
					list.add(s);
				}
			}
			arr = list.toArray(new String[list.size()]);
			scd.setDay(i+1);
			//scd.set
			for(int k=0; k<arr.length; k++) {
				int pnum = Integer.parseInt(arr[k]);
				scd.setPlace_num(pnum);
				ss.insertDetail(scd);
			}
			list.clear();
		}
		model.addAttribute("results",results);
		model.addAttribute("sch_num",sch_num);
		model.addAttribute("m_num",m_num);
		return "schedule/updateSch";
	}
	
	@RequestMapping("schedule/deleteSch")
	public String deleteSch(Model model, int sch_num, HttpSession session) {
		int m_num = (Integer) session.getAttribute("m_num");
		ss.deleteScd(sch_num);
		int result = ss.deleteSch(sch_num);
		model.addAttribute("m_num",m_num);
		model.addAttribute("result",result);
		return "schedule/deleteSch";
	}
	
	@RequestMapping("schedule/placeModal")
	public String placeModal(String place_num,HttpSession session, Model model) {
		int num = Integer.parseInt(place_num);
		Place place = ps.placeModal(num);
		float avgScore = ps.avgScore(num);
		String id = (String) session.getAttribute("id");
		String bookMarkImgSrc ="";
		
		if(id != null) {
			Bookmark bookMark = ps.bookMarkChk(id, num);
			if(bookMark != null) {
				bookMarkImgSrc = "/goat/resources/bookMarkImg/bookmark.png";
			}else {
				bookMarkImgSrc = "/goat/resources/bookMarkImg/nobookmark.png";
			}
		}else {
			bookMarkImgSrc = "/goat/resources/bookMarkImg/nobookmark.png";
		}

		model.addAttribute("bookMarkImgSrc", bookMarkImgSrc);		
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("place", place);
		return "schedule/placeModal";
	}
}
