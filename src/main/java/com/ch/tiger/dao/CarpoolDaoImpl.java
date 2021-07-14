package com.ch.tiger.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Carpool;

@Repository
public class CarpoolDaoImpl implements CarpoolDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Carpool carpool) {
		return sst.insert("carpoolns.insert", carpool);
	}

	@Override
	public List<Carpool> carpoolList(Carpool carpool) {
		return sst.selectList("carpoolns.carpoolList", carpool);
	}

	@Override
	public int getTotal(Carpool carpool) {
		return sst.selectOne("carpoolns.getTotal", carpool);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("carpoolns.getMaxNum");
	}




}


