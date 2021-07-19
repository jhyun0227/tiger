package com.ch.tiger.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService rvs;
	@Autowired
	private MemberService mbs;
	@Autowired
	private CarpoolService cps;
	
	@RequestMapping("driveHistoryList")
	public String driveHistoryList(Carpool carpool, String pageNum, Model model, HttpSession session) {
		// 세션 값 가져오기
		String MB_id = (String) session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		carpool.setMB_num(MB_num); // total 값을 알아내기 위해 먼저 객체에 넣음, 검색의 경우에는 자동으로 들어가지만 덮어 씌움
		
		// 페이징
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보이는 게시글 수
		int total = cps.getTotalMyRvs(carpool);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		// 가져오고 싶은 정보들을 객체에 담아서 보냄
		carpool.setStartRow(startRow);
		carpool.setEndRow(endRow);
		List<Carpool> myCarpoolList = cps.myCarpoolList(carpool); // 내가 올린 글 들만 담아서 받아옴
		
		int num = total - startRow + 1; // 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
//		String[] title = {}; 나중에 
		
//		model.addAttribute("title", title); 나중에
		model.addAttribute("pb", pb);
		model.addAttribute("myCarpoolList", myCarpoolList);
		model.addAttribute("num", num);
		return "reservation/driveHistoryList";
	}
}
