package com.ch.tiger.service;

import com.ch.tiger.model.Review;

public interface ReviewService {
	int insert(Review review); // 리뷰 데이터 입력

	Review selectRv(Review review); // 리뷰 등록 중복 방지
}
