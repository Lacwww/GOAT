package com.ch.goat.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Member {
	private int m_num;
	private String m_id;
	private String m_pass;
	private String m_nick;
	private String m_email;
	private String m_name;
	private String m_tel;
	private Date m_birth;
	private String m_addr;
	private String m_addrd;
	private Date reg_date;
	private String m_photo;
	private String del;
	private String admin;
	// upload용
	private MultipartFile file;
}
