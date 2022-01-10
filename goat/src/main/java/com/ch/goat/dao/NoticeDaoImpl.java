package com.ch.goat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.goat.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(Notice notice) {
		return sst.selectOne("noticens.getTotal", notice);
	}

	public List<Notice> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("noticens.list", map);
	}

	public int maxNum() {
		return sst.selectOne("noticens.maxNum");
	}

	public int insert(Notice notice) {
		return sst.insert("noticens.insert", notice);
	}

	public void updateViewcount(int no_num) {
		sst.update("noticens.updateViewcount", no_num);
	}

	public Notice select(int no_num) {
		return sst.selectOne("noticens.select", no_num);
	}

	public int delete(int no_num) {
		return sst.update("noticens.delete", no_num);
	}

	public int update(Notice notice) {
		return sst.update("noticens.update", notice);
	}
}