package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ScheduleDetail {
	private int schd_num;
	private Date day;
	private String vehicle;
	private int sch_num;
	private int place_num;
}
