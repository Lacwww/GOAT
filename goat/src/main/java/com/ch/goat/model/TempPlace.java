package com.ch.goat.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TempPlace {
	private int temp_num;
	private String temp_name;
	private String temp_cate;
	private String temp_addr;
	private String temp_addrd;
	private String temp_photo;
	private String lat;
	private String lng;
	private Date reg_date;
	private String temp_content;
	private String temp_area;
	private String temp_tag;
	private String temp_areadetail;
	private String temp_crud;
	private int place_num;
	private String del;
	private int m_num;
	private String temp_explanation;
	
	// upload용
	private MultipartFile file;
}
