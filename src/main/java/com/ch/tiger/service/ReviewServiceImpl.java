package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ReviewDao;
import com.ch.tiger.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao rd;

	@Override
	public int insert(Review review) {
		return rd.insert(review); // 리뷰 데이터 입력
	}

	@Override
	public Review selectRv(Review review) {
		return rd.selectRv(review); // 리뷰 등록 중복 방지
	}

}
