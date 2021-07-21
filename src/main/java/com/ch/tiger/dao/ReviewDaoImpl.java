package com.ch.tiger.dao;

import java.util.List;

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

	@Override
	public List<Review> selectMb(int MB_num) {
		return sst.selectList("reviewns.selectMb", MB_num); // 프로필에서 회원 한명의 리뷰 정보를 가져오기 위해
	}

	@Override
	public float selectAvg(int MB_num) {
		return sst.selectOne("reviewns.selectAvg", MB_num); // 리뷰 평균을 가져옴
	}

}
