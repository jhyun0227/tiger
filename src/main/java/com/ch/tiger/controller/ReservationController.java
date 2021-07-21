package com.ch.tiger.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Reservation;
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
	
	// 예약내역에서 드라이버로서 본인이 작성한 글들을 확인하기 위해서 가져옴
	@RequestMapping("driverHistoryList")
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
		String[] title = {"출발일", "출발지", "도착지"};
		
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);
		model.addAttribute("myCarpoolList", myCarpoolList);
		model.addAttribute("num", num);
		return "reservation/driverHistoryList";
	}
	
	// 드라이버 예약 내역에서 리뷰 작성을 위해 본인의 글을 이용한 사람을 찾아내기 위함
	@RequestMapping("driverReservationList")
	public String driverReservationList(Reservation reservation, Model model) {
		List<Reservation> rvsList = rvs.selectList(reservation); // reservation 객체에는 CP_num 데이터만 들어있어서 게시글에서 예약이 완료된 사람들의 리스트를 가져옴
		model.addAttribute("rvsList", rvsList);  // rvList의 reservation 객체에는 탑승자 MB_num이 담겨 있음
		return "nolayout/driverReservationList";
	}
	
	// 예약내역에서 탑승자로서 이용했던 글들을 가져 오는 로직
	@RequestMapping("PsgHistoryList")
	public String PsgHistoryList(Reservation reservation, String pageNum, Model model, HttpSession session) {
		// 세션 값 가져오기
		String MB_id = (String) session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		reservation.setMB_num(MB_num); // total 값을 알아내기 위해 먼저 객체에 넣음, 검색의 경우에는 자동으로 들어가지만 덮어 씌움
		
		// 페이징
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보이는 게시글 수
		int total = rvs.getTotalMyRv(reservation);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		// 가져오고 싶은 정보들을 객체에 담아서 보냄
		reservation.setStartRow(startRow);
		reservation.setEndRow(endRow);
		List<Reservation> myRvList = rvs.myRvList(reservation); // 내가 예약한 글들만 담아서 받아옴
		for (Reservation rv : myRvList) {
			int CP_num = rv.getCP_num(); // 예약 테이블에서 내가 예약 신청한 게시글의 번호를 가져옴
			Carpool carpool = cps.select(CP_num); // 가져온 게시글 번호로 게시글의 정보를 가져옴
			int MB_numDv = carpool.getMB_num(); // 게시글 정보에서 게시글 작성자(드라이버)의 번호를 가져옴
			Member member2 = mbs.selectNum(MB_numDv); // 게시글 작성자의 번호를 이용해서 게시글 작성자의 정보를 가져옴
			rv.setMB_numDv(member2.getMB_num()); // 가져온 정보를 이용해서 객체에 적용
			rv.setMB_nickNameDv(member2.getMB_nickName()); // 가져온 정보를 이용해서 객체에 적용
			rv.setMB_num(MB_num); // 탑승자의 번호를 재설정 해줌
		}
		
		int num = total - startRow + 1; // 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"출발일", "출발지", "도착지"};
		
		
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);
		model.addAttribute("myRvList", myRvList);
		model.addAttribute("num", num);				
		return "reservation/PsgHistoryList";
	}
}
