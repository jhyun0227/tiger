package com.ch.tiger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getMaxNum() {
		return sst.selectOne("reportns.getMaxNum");
	}

	@Override
	public int RPinsert(Report report) {
		return sst.insert("reportns.RPinsert", report);
	}


}
