package com.ch.tiger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Apply;

@Repository
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Apply select(int MB_num) {
		return sst.selectOne("applyns.select", MB_num); // 신청기록이 있는지 알기 위해
	}
}
