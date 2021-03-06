package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.NoticeReply;

public interface NoticeReplyService {

	List<NoticeReply> list(int no_num);

	void insert(NoticeReply nr);

	void delete(NoticeReply nr);

	void update(NoticeReply nr);

	NoticeReply select(int nor_num);

	int maxNum();

	void updateStep(NoticeReply nr);

	int maxStep(int nor_ref);

}
