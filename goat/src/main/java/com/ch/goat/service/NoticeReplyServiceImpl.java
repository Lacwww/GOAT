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

	public void update(NoticeReply nr) {
		nd.update(nr);
	}

	public NoticeReply select(int nor_num) {
		return nd.select(nor_num);
	}
	public int maxNum() {
		return nd.maxNum();
	}

	public void updateStep(NoticeReply nr) {
		nd.updateStep(nr);
	}

	public int maxStep() {
		return nd.maxStep();
	}
}