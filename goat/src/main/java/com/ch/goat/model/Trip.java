package com.ch.goat.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Trip {
	private int t_num;
	private String t_title;
	private String t_content;
	private Date reg_date;
	private int t_view;
	private String del;
	private int m_num;
	
	// 페이징용
	private int startRow;
	private int endRow;
	
	// upload용
	private MultipartFile file;
	
	// 작성자띄우기
	private String m_name;
	private String m_nick;
	
	// 검색용
	private String search;
	private String keyword;
}
