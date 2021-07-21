package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Review;

public interface ReviewDao {
	int insert(Review review); // 리뷰 데이터 입력

	Review selectRv(Review review); // 리뷰 등록 중복 방지

	List<Review> selectMb(int MB_num); // 프로필에서 회원 한명의 리뷰 정보를 가져오기 위해

	float selectAvg(int MB_num); // 리뷰 평균을 가져옴

}
