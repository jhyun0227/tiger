package com.ch.tiger.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Favorite;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Reservation;
import com.ch.tiger.service.FavoriteService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.ReviewService;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService fs;
	@Autowired
	private MemberService mbs;
	@Autowired
	private ReviewService rs;
	
	@RequestMapping("favoriteList")
	public String favoriteList(Favorite favorite, String pageNum, HttpSession session, Model model) {
		// 세션값 받기
		String MB_id = (String)session.getAttribute("MB_id"); // 세션값을 가져옴
		Member member = mbs.select(MB_id);
		int MB_numG = member.getMB_num(); // 좋아요를 한 사람 이름의 변수의 로그인 한 사람의 등록번호를 넣음
		favorite.setMB_numG(MB_numG);
		
		// 페이징
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보이는 게시글 수
		int total = fs.getTotal(favorite);
		System.out.println(total);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;		
		
		// 가져오고 싶은 정보들을 객체에 담아서 보냄
		favorite.setStartRow(startRow);
		favorite.setEndRow(endRow);
		List<Favorite> fvList = fs.list(favorite);
		for (Favorite fv : fvList) {
			// 리뷰 평점 구하기
			float reviewAvg = rs.selectAvg(fv.getMB_numT()); // 회원의 리뷰 평균 평점을 가져옴			
			fv.setReviewAvg(reviewAvg);
		}
		
		int num = total - startRow + 1; // 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"닉네임", "아이디"};

		model.addAttribute("title", title);
		model.addAttribute("pb", pb);
		model.addAttribute("fvList", fvList);
		model.addAttribute("num", num);	
		return "mypage/favoriteList";
	}
	 
	// 좋아요 추가
	@RequestMapping("addFv")
	public String addFv(Favorite favorite, String MB_nickName, Model model) {
		int result = fs.addFv(favorite);
		model.addAttribute("result", result);
		model.addAttribute("MB_nickName", MB_nickName);
		return "favorite/addFv";
	}
	
	// 좋아요 삭제
	@RequestMapping("deleteFv")
	public String deleteFv(Favorite favorite, String MB_nickName, Model model) {
		int result = fs.deleteFv(favorite);
		model.addAttribute("result", result);
		model.addAttribute("MB_nickName", MB_nickName);
		return "favorite/deleteFv";
	}
}
