package com.ch.tiger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Apply;
import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.QnA;
import com.ch.tiger.model.Report;
import com.ch.tiger.model.Reservation;
import com.ch.tiger.service.ApplyService;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.QnAService;
import com.ch.tiger.service.ReportService;
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
	
	@Autowired
	private ReportService rps;
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("adminMain")
	public String adminMain(Apply apply, Carpool carpool, QnA qna, Report report, Reservation reservation, Model model) {
	
		// 타세요 관리 리스트
		List<Carpool> cpAllList = cps.cpAllList(carpool);
		
		// 예약내역 리스트
		List<Reservation> rvAllList = rvs.rvAllList(reservation);
		for (Reservation rv : rvAllList) {	
	         int CP_num = rv.getCP_num();
	         Carpool carpool1 = cps.select(CP_num); 
	         int MB_numDv = carpool1.getMB_num(); 
	         Member member = mbs.selectNum(MB_numDv); 
	         rv.setMB_nickNameDv(member.getMB_nickName()); 
	         Member memberDB = mbs.selectNum(rv.getMB_num());
	         rv.setMB_nickName(memberDB.getMB_nickName());
	      }
	
		// 드라이버승인 리스트
		List<Apply> applyAllList = as.applyAllList(apply);
		
		// 문의내역 리스트 
		List<QnA> qnaAllList = qas.qnaAllList(qna);
		
		// 신고내역 리스트
		List<Report> rpAllList = rps.rpAllList(report);	// 신고 목록
		
		model.addAttribute("applyAllList", applyAllList);	
		model.addAttribute("cpAllList", cpAllList);	
		model.addAttribute("qnaAllList", qnaAllList);	
		model.addAttribute("rpAllList", rpAllList);	
		model.addAttribute("rvAllList", rvAllList);	
		
		return "admin/adminMain";
	}
	
}