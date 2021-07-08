package com.ch.tiger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarpoolDaoImpl implements CarpoolDao {
	@Autowired
	private SqlSessionTemplate sst;
}
