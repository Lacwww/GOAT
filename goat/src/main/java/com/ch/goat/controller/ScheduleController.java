package com.ch.goat.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.ScheduleDetail;
import com.ch.goat.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;

	@RequestMapping("schedule/selectArea")
	public String selectArea(Model model) {
		List<Area> list = ss.list();
		model.addAttribute("list", list);
		return "schedule/selectArea";
	}

	@RequestMapping("schedule/selectModal")
	public String selectModal(Model model, String place_area) {
		Area area = ss.select(place_area);
		model.addAttribute("area", area);
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
		model.addAttribute("sch_num",sch_num);
		return "schedule/insertSchedule";
	}
	@RequestMapping("schedule/scView")
	public String schView(Model model, HttpSession session,int sch_num ) {
		Schedule sch = ss.selectSch(sch_num);
		String s_date = DateFormatUtils.format(sch.getS_date(), "yyyy-MM-dd");
		String e_date = DateFormatUtils.format(sch.getE_date(), "yyyy-MM-dd");
		int days = ss.days(s_date,e_date);
		List<ScheduleDetail> list = ss.selectScd(sch_num); 
		String place_area = ss.selectArea(list.get(0).getPlace_num());
		
		model.addAttribute("place_area",place_area);
		model.addAttribute("days",days);
		model.addAttribute("sch",sch);
		model.addAttribute("list",list);
		return "schedule/scView";
	}
}
