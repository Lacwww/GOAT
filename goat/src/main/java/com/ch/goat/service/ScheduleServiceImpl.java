package com.ch.goat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.ScheduleDao;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDao sd;
}
