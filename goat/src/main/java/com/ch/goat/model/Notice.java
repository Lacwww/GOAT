package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private int no_num;
	private String no_title;
	private String no_content;
	private Date reg_date;
	private int no_view;
	private String del;
	private int m_num;
	
	// 페이징용
	private int startRow;
	private int endRow;
	
	// 공지사항 작성자띄우기
	private String m_name;
	private String m_nick;
}
