package com.ch.goat.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CsDaoImpl implements CsDao{
	@Autowired
	private SqlSessionTemplate sst;
}
