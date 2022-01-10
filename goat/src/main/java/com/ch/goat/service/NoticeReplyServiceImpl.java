package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.NoticeReplyDao;
import com.ch.goat.model.NoticeReply;

@Service
public class NoticeReplyServiceImpl implements NoticeReplyService{
	@Autowired
	private NoticeReplyDao nd;

	public List<NoticeReply> list(int no_num) {
		return nd.list(no_num);
	}

	public void insert(NoticeReply nr) {
		nd.insert(nr);
	}

	public void delete(NoticeReply nr) {
		nd.delete(nr);
	}
}