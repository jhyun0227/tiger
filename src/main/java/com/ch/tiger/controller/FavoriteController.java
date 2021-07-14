package com.ch.tiger.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Favorite;
import com.ch.tiger.model.Member;
import com.ch.tiger.service.FavoriteService;
import com.ch.tiger.service.MemberService;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService fs;
	@Autowired
	private MemberService mbs;
	
	@RequestMapping("favoriteList")
	public String likeList(HttpSession session, Model model) {
		// 세션값 받기
		String MB_id = (String)session.getAttribute("MB_id"); // 세션값을 가져옴
		Member member = mbs.select(MB_id);
		int MB_numG = member.getMB_num(); // 좋아요를 한 사람 이름의 변수의 로그인 한 사람의 등록번호를 넣음
		
		// 리스트 불러오기
		List<Favorite> fvList = fs.list(MB_numG);
		model.addAttribute("fvList", fvList);
		return "mypage/favoriteList";
	}
}
