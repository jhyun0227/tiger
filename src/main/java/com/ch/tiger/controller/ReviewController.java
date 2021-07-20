package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Reservation;
import com.ch.tiger.model.Review;
import com.ch.tiger.service.ReservationService;
import com.ch.tiger.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rs;
	@Autowired
	private ReservationService rvs;
	
	// 리뷰 작성 폼으로 이동
	@RequestMapping("reviewWriteForm")
	public String reviewWriteForm(Review review, String MB_nickName, Model model) {		
		// 리뷰 중복 등록 불가능 하게 하기 위해
		int result = 0;
		Review review2 = rs.selectRv(review);
		if (review2 != null) {
			result = 1;
			model.addAttribute("result", result);
		} else {
			result = 0;
			model.addAttribute("result", result);
			model.addAttribute("review", review);
			model.addAttribute("MB_nickName", MB_nickName); // 후기 대상자의 별명
		}
		return "nolayout/reviewWriteForm";
	}
	
	// 리뷰 작성 결과로 이동
	@RequestMapping("reviewWriteResult")
	public String reviewWriteResult(Review review, Model model) {
		int result = rs.insert(review);
		if (result > 0) {
			model.addAttribute("result", result); // 데이터 입력 결과를 보내주기
			
			// 결과 페이지에서 다시 리스트로 보내기 위해 정보를 구해오는 로직
			int RSV_num = review.getRSV_num();
			Reservation reservation = rvs.selectCp(RSV_num);
			model.addAttribute("reservation", reservation);
		}
		return "nolayout/reviewWriteResult";
	}
}
