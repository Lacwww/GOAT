package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Place {
	private int place_num;
	private String place_name;
	private String place_cate;
	private String place_addr;
	private String place_addrd;
	private String filename;
	private String lat;
	private String lng;
	private Date reg_date;
}
