package com.ch.goat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeReply {
	private int nor_num;
	private String nor_content;
	private Date reg_date;
	private String del;
	private int nor_ref;
	private int nor_re_step;
	private int nor_re_level;
	private int m_num;
	private int no_num;
}
