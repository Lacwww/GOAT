package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Schedule {
	private int sch_num;
	private String sch_name;
	private Date s_date;
	private Date e_date;
	private int m_num;
	
	//--------------------------
	private String m_name;
}
