package com.ch.goat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.NoticeReply;

@Repository
public class NoticeReplyDaoImpl implements NoticeReplyDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<NoticeReply> list(int no_num) {
		return sst.selectList("rpnns.list", no_num);
	}
	public void insert(NoticeReply nr) {
		sst.insert("rpnns.insert", nr);
	}
	public void delete(NoticeReply nr) {
		sst.delete("rpnns.delete", nr);
	}
}