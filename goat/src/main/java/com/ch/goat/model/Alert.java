package com.ch.goat.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Alert {
	private int ale_num;
	private int m_num;
	private int sch_num;
	private String sch_name;
	private Date s_date;
	private int day;
	private int temp_num;
	private String temp_name;
	private String temp_crud;
	private int place_num;
	private String del;
	private int cs_num;
	private String cs_title;
	private int t_num;
	private String t_title;
}
