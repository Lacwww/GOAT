package com.ch.goat.model;

import lombok.Data;

@Data
public class ScheduleDetail {
	private int schd_num;
	private int day;
	private String vehicle;
	private int sch_num;
	private int place_num;
	
	//플레이스 위도,경도,이름 참고용 model
	private String place_name;
	private String lat;
	private String lng;
}
