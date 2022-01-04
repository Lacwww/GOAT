package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class PlaceReview {
	private int prev_num;
	private String prev_title;
	private float score;
	private String prev_content;
	private String del;
	private Date reg_date;
	private int m_num;
	private int place_num;
}
