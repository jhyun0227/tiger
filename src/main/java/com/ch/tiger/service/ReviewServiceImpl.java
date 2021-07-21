package com.ch.tiger.service;

import java.util.List;

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

	@Override
	public List<Review> selectMb(int MB_num) {
		return rd.selectMb(MB_num); // 프로필에서 회원 한명의 리뷰 정보를 가져오기 위해
	}

	@Override
	public float selectAvg(int MB_num) {
		return rd.selectAvg(MB_num); // 리뷰 평균을 가져옴
	}

}
