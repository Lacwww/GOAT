package com.ch.goat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.TripReplyDao;
import com.ch.goat.model.Alert;
import com.ch.goat.model.TripReply;

@Service
public class TripReplyServiceImpl implements TripReplyService{
	@Autowired
	private TripReplyDao trd;

	public List<TripReply> list(int t_num) {
		return trd.list(t_num);
	}

	public void insert(TripReply tr) {
		trd.insert(tr);
	}

	public void delete(TripReply tr) {
		trd.delete(tr);
	}

	public void update(TripReply tr) {
		trd.update(tr);
	}

	public TripReply select(int tre_num) {
		return trd.select(tre_num);
	}
	public int maxNum() {
		return trd.maxNum();
	}

	public void updateStep(TripReply tr) {
		trd.updateStep(tr);
	}

	public int maxStep(int nor_ref) {
		return trd.maxStep(nor_ref);
	}

	public void trAlert(Alert ale) {
		trd.trAlert(ale);
	}

	public List<Alert> alertCon(int m_num) {
		return trd.alertCon(m_num);
	}
}