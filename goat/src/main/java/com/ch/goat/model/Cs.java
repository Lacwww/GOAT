package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Cs {
	private int cs_num;
	private String cs_title;
	private Date reg_date;
	private String cs_content;
	private int cs_view;
	private int cs_ref;
	private int cs_re_step;
	private int cs_re_level;
	private int m_num;
	private String del;
	
	// 페이징용
	private int startRow;
	private int endRow;
	
	// 고객문의 작성자띄우기
	private String m_name;
}