package com.ch.tiger.dao;

import com.ch.tiger.model.Review;

public interface ReviewDao {
	int insert(Review review); // 리뷰 데이터 입력

	Review selectRv(Review review); // 리뷰 등록 중복 방지

}
