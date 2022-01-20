package com.ch.goat.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Place {
	private int place_num;
	private String place_name;
	private String place_cate;
	private String place_addr;
	private String place_addrd;
	private String place_photo;
	private String lat;
	private String lng;
	private Date reg_date;
	private String place_content;
	private String place_area;
	private String place_tag;
	private String place_areadetail;
	 
	
	private String keyword;
	private String search; 
	
	// upload용
	private MultipartFile file;
}
