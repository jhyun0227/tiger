package com.ch.tiger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Review review) {
		return sst.insert("reviewns.insert", review); // 리뷰 데이터 입력
	}

	@Override
	public Review selectRv(Review review) {
		return sst.selectOne("reviewns.selectRv", review); // 리뷰 등록 중복 방지
	}

}
