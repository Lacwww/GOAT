package com.ch.goat.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TripPhoto {
	private int tp_num;
	private String filename;
	private int t_num;
	
	// upload용
	private MultipartFile file;
}
