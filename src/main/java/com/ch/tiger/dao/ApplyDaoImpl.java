package com.ch.tiger.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Apply;
@Repository
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int getApplyTotal(Apply apply) {
		return sst.selectOne("applyns.getApplyTotal", apply);
	}
	@Override
	public List<Apply> applyList(Apply apply) {
		return sst.selectList("applyns.applyList", apply);
	}
}
