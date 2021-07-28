package com.ch.tiger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Reservation;
import com.ch.tiger.service.ApplyService;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.QnAService;
import com.ch.tiger.service.ReservationService;

@Controller
public class HomeController {
	@Autowired
	private ApplyService as;

	@Autowired
	private CarpoolService cps;

	@Autowired
	private ReservationService rvs;
	
	@Autowired
	private MemberService mbs;
	
	@Autowired
	private QnAService qas;
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("adminMain")
	public String adminMain(Reservation reservation, String pageNum, Model model) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		} 
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = rvs.getTotalRv(reservation);	//추가 0723
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		reservation.setStartRow(startRow);
		reservation.setEndRow(endRow);
		// 0723 수정 및 추가(테스트)
		List<Reservation> adminRvAllList = rvs.adminRvAllList(reservation);	// 추가 0723
		for (Reservation rv : adminRvAllList) {	// 추가 0723
	         int CP_num = rv.getCP_num(); // 예약 테이블에서 내가 예약 신청한 게시글의 번호를 가져옴
	         Carpool carpool = cps.select(CP_num); // 가져온 게시글 번호로 게시글의 정보를 가져옴
	         int MB_numDv = carpool.getMB_num(); // 게시글 정보에서 게시글 작성자(드라이버)의 번호를 가져옴
	         Member member2 = mbs.selectNum(MB_numDv); // 게시글 작성자의 번호를 이용해서 게시글 작성자의 정보를 가져옴
	         rv.setMB_numDv(member2.getMB_num()); // 가져온 정보를 이용해서 객체에 적용
	         rv.setMB_nickNameDv(member2.getMB_nickName()); // 가져온 정보를 이용해서 객체에 적용
	         Member memberDB = mbs.selectNum(rv.getMB_num());
	         rv.setMB_nickName(memberDB.getMB_nickName());
	      }
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		//String[] title = {"작성자", "신청자", "출발지", "도착지"};	// 테이블에 칼럼없어서 불가/ 조인하면 닉네임하나는 가능
		String[] title = {"출발지", "도착지"};
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("adminRvAllList", adminRvAllList);	// 수정 0723
		model.addAttribute("num", num);	//목록 번호 생성 위한 num
		return "admin/adminMain";
	}
	
}