package com.ch.tiger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sst;
}
