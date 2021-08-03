package com.ch.tiger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Apply;
import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Notice;
import com.ch.tiger.model.QnA;
import com.ch.tiger.model.Report;
import com.ch.tiger.model.Reservation;
import com.ch.tiger.service.ApplyService;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.NoticeService;
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
	private MemberService mbs;
	@Autowired
	private NoticeService ns;
	@Autowired
	private QnAService qas;
	@Autowired
	private ReportService rps;
	@Autowired
	private ReservationService rvs;
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("adminMain")
	public String adminMain(Apply apply, Carpool carpool, Notice notice, QnA qna, Report report, Reservation reservation, Model model) {
	
		// 타세요 관리 목록
		List<Carpool> cpAllList = cps.cpAllList(carpool);
		
		// 예약내역 목록
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
		
		// 드라이버승인 목록
		List<Apply> applyAllList = as.applyAllList(apply);
				
		// 공지사항 목록
		List<Notice> noticeAllList = ns.noticeAllList(notice);	
		
		// 문의내역 목록
		List<QnA> qnaAllList = qas.qnaAllList(qna);
		
		// 신고내역 목록
		List<Report> rpAllList = rps.rpAllList(report);	
		
		model.addAttribute("cpAllList", cpAllList);	
		model.addAttribute("rvAllList", rvAllList);	
		model.addAttribute("applyAllList", applyAllList);	
		model.addAttribute("noticeAllList", noticeAllList);	
		model.addAttribute("qnaAllList", qnaAllList);	
		model.addAttribute("rpAllList", rpAllList);	
		
		return "admin/adminMain";
	}
	
}