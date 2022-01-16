package com.ch.goat.service;

import java.util.List;

import com.ch.goat.model.TripReply;

public interface TripReplyService {

	List<TripReply> list(int t_num);

	void insert(TripReply tr);

	void delete(TripReply tr);

	void update(TripReply tr);

	TripReply select(int tre_num);

	int maxNum();

	void updateStep(TripReply tr);

	int maxStep(int tre_ref);

}
