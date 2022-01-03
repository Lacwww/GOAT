package com.ch.goat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.goat.dao.CsDao;

@Service
public class CsServiceImpl implements CsService{
	@Autowired
	private CsDao cd;
}
