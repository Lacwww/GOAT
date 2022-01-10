package com.ch.goat.dao;

import java.util.List;

import com.ch.goat.model.NoticeReply;

public interface NoticeReplyDao {

	List<NoticeReply> list(int no_num);

	void insert(NoticeReply nr);

	void delete(NoticeReply nr);

}