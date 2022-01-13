package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class TripReply {
	private int tre_num;
	private String tre_content;
	private Date reg_date;
	private String del;
	private int tre_ref;
	private int tre_re_step;
	private int tre_re_level;
	private int t_num;
	private int m_num;
}
