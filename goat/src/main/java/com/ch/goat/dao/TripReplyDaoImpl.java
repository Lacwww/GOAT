package com.ch.goat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.goat.model.Alert;
import com.ch.goat.model.TripReply;

@Repository
public class TripReplyDaoImpl implements TripReplyDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<TripReply> list(int t_num) {
		return sst.selectList("tripReplyns.list", t_num);
	}
	public void insert(TripReply tr) {
		sst.insert("tripReplyns.insert", tr);
	}
	public void delete(TripReply tr) {
		sst.update("tripReplyns.delete", tr);
	}
	public void update(TripReply tr) {
		sst.update("tripReplyns.update", tr);
	}
	public TripReply select(int tre_num) {
		return sst.selectOne("tripReplyns.select", tre_num);
	}
	public int maxNum() {
		return sst.selectOne("tripReplyns.maxNum");
	}
	public void updateStep(TripReply tr) {
		sst.update("tripReplyns.updateStep", tr);
	}
	public int maxStep(int tre_ref) {
		return sst.selectOne("tripReplyns.maxStep", tre_ref);
	}
	public void trAlert(Alert ale) {
		sst.insert("tripReplyns.trAlert", ale);
	}
	public List<Alert> alertCon(int m_num) {
		return sst.selectList("tripReplyns.alertCon", m_num);
	}
}