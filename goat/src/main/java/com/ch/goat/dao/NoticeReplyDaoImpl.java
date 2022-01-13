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
		sst.update("rpnns.delete", nr);
	}
	public void update(NoticeReply nr) {
		sst.update("rpnns.update", nr);
	}
	public NoticeReply select(int nor_num) {
		return sst.selectOne("rpnns.select", nor_num);
	}
	public int maxNum() {
		return sst.selectOne("rpnns.maxNum");
	}
	public void updateStep(NoticeReply nr) {
		sst.update("rpnns.updateStep", nr);
	}
	public int maxStep(int nor_ref) {
		return sst.selectOne("rpnns.maxStep", nor_ref);
	}
}