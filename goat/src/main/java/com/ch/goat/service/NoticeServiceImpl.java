package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.NoticeDao;
import com.ch.goat.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nd;
	
	public int getTotal(Notice notice) {
		return nd.getTotal(notice);
	}
	public List<Notice> list(int startRow, int endRow) {
		return nd.list(startRow, endRow);
	}
	public int maxNum() {
		return nd.maxNum();
	}
	public int insert(Notice notice) {
		return nd.insert(notice);
	}
	public void updateViewcount(int no_num) {
		nd.updateViewcount(no_num);
	}
	public Notice select(int no_num) {
		return nd.select(no_num);
	}
	public int delete(int no_num) {
		return nd.delete(no_num);
	}
	public int update(Notice notice) {
		return nd.update(notice);
	}
	
}