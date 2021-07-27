package com.ch.tiger.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Report;
import com.ch.tiger.model.Reservation;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.ReportService;
import com.ch.tiger.service.ReservationService;


@Controller
public class CarpoolController {
	
	@Autowired
	private CarpoolService cps;

	@Autowired
	private ReportService rps;
	
	@Autowired
	private MemberService mbs;
	
	@Autowired
	private ReservationService rvs;
	
	// 타세요 리스트
	@RequestMapping("cpList")
	public String cpList(Carpool carpool, String pageNum, Model model) {
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보여주는 게시글 갯수
		int total = cps.getTotal(carpool);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		carpool.setStartRow(startRow);
		carpool.setEndRow(endRow);
		List<Carpool> cpList = cps.cpList(carpool);
		int CP_num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("CP_num", CP_num);
		model.addAttribute("carpool", carpool);
		model.addAttribute("pb", pb);
		model.addAttribute("cpList", cpList);
		return "carpool/cpList";
	}
	
	// 타세요 작성폼
	@RequestMapping("cpWriteForm")
	public String cpWriteForm(int CP_num, Member member, String pageNum, Model model, HttpSession session){
		String MB_id = (String)session.getAttribute("MB_id");
		member = mbs.select(MB_id);
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpWriteForm";
	}
	
	// 타세요 작성폼 결과 안내
	@RequestMapping("cpWriteResult")
	public String cpWriteResult(Carpool carpool, String pageNum, Model model){
		int number = cps.getMaxNum(); // 타세요 글번호 생성
		carpool.setCP_num(number);
		int result = cps.insert(carpool);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpWriteResult";
	}
	
	// 타세요 리스트 상세보기
	@RequestMapping("cpView")
	public String cpView(HttpServletRequest request, int CP_num, String pageNum, Model model, HttpSession session) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		List<Reservation> reservationList = rvs.reservationList(reservation); // reservation 테이블 정보 list로 보여줌
		String MB_id = (String)session.getAttribute("MB_id");// 로그인한 회원의 정보
		Member member = mbs.select(MB_id); // 로그인한 회원의 정보
		Carpool carpool = cps.select(CP_num); // 타세요 작성자 MB_num 조회
		Member memberDB = null; // 타세요 작성한 회원 닉네임 같이 보여주기
		memberDB = mbs.selectNum(carpool.getMB_num());
		// referer 전페이지로 이동(pageNum 포함)
		String preUrl = request.getHeader("Referer");
		preUrl = preUrl.substring(28);
		model.addAttribute("preUrl", preUrl);
		model.addAttribute("memberDB", memberDB);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("member", member);
		model.addAttribute("carpool", carpool);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpView";
	}
	//referer 적용 전 cpView controller
	/*
	 * @RequestMapping("cpView") public String cpView(int CP_num, String pageNum,
	 * Model model, HttpSession session) { Reservation reservation = new
	 * Reservation(); reservation.setCP_num(CP_num); List<Reservation>
	 * reservationList = rvs.reservationList(reservation); // reservation 테이블 정보
	 * list로 보여줌 String MB_id = (String)session.getAttribute("MB_id");// 로그인한 회원의 정보
	 * Member member = mbs.select(MB_id); // 로그인한 회원의 정보 Carpool carpool =
	 * cps.select(CP_num); // 타세요 작성자 MB_num 조회 Member memberDB = null; // 타세요 작성한
	 * 회원 닉네임 같이 보여주기 memberDB = mbs.selectNum(carpool.getMB_num());
	 * model.addAttribute("memberDB", memberDB);
	 * model.addAttribute("reservationList", reservationList);
	 * model.addAttribute("member", member); model.addAttribute("carpool", carpool);
	 * model.addAttribute("pageNum", pageNum); return "carpool/cpView"; }
	 */
	
	// 타세요 신고하기 폼
	@RequestMapping("cpReportForm")
	public String cpReportForm(Report report, String pageNum, Model model) {
		model.addAttribute("report", report);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpReportForm";
	}
	
	// 타세요 신고하기 결과 안내
	@RequestMapping("cpReportResult")
	public String cpReportResult(Report report, String pageNum, Model model) {
		int number = rps.getMaxNum(); // 1. 신고 글번호 생성
		report.setRP_num(number); // 2. report table의  RP_num(max번호 +1) 설정
		int result = rps.RPinsert(report);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpReportResult";
	}
	
	// 타세요 게시글 수정(작성한 회원만 가능)
	@RequestMapping("cpUpdateForm")
	public String cpUpdateForm(int CP_num, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id"); // session에 저장된 MB_id를 통해 MB_num 정보 받기
		Member member = mbs.select(MB_id);
		Carpool carpool = cps.select(CP_num);
		model.addAttribute("member", member);
		model.addAttribute("carpool", carpool);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpUpdateForm";
	}
	
	// 타세요 게시글 수정 결과 안내
	@RequestMapping("cpUpdateResult")
	public String cpUpdateResult(Carpool carpool, String pageNum, Model model) {
		int result = cps.update(carpool);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpUpdateResult";
	}
	
	// 타세요 게시글 삭제
	@RequestMapping("cpDeleteForm")
	public String cpDeleteForm(int CP_num, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id"); // session에 저장된 MB_id를 통해 MB_pw 정보 받기
		Member member = mbs.select(MB_id);
		Carpool carpool = cps.select(CP_num);
		model.addAttribute("member", member); // 게시글 삭제시 회원 비밀번호 검사 후 삭제
		model.addAttribute("carpool", carpool);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpDeleteForm";
	}
	
	// 타세요 게시글 삭제 결과 안내
	@RequestMapping("cpDeleteResult")
	public String cpDeleteResult(int CP_num, String pageNum, Model model) {
		int result = cps.delete(CP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpDeleteResult";
	}
	
	// 타세요 신청버튼 클릭시
	@RequestMapping("cpRequestResult")
	public String cpRequestList(int CP_num, int MB_num, String pageNum, Model model) {
		int result = 0;
		Reservation reservation = new Reservation(); // reservation에 CP_num과 MB_num값 저장 
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		// 신청버튼 중복 클릭 방지
		Reservation reservation2 = rvs.selectRv(reservation);
		if (reservation2 != null) {
			result = -1; // 신청한 정보가 이미 있음
		} else {
			result = rvs.insert(reservation); // 신청 성공/실패
		}
		model.addAttribute("CP_num", CP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpRequestResult";
	}
	
	// 타세요 드라이버 로그인 >> 매칭 여부 컬럼 "수락" 버튼 클릭시
	@RequestMapping("cpAcceptResult")
	public String cpAcceptResult(int CP_num, int MB_num, Model model) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		int result = rvs.updateAccept(reservation);
		int addNumResult = cps.updatePassNumNow(CP_num); // 드라이버가 수락을해서 신청한 회원이 매칭완료상태가될때마다 CP_passNumNow에 +1 해줌
		model.addAttribute("addNumResult", addNumResult);
		model.addAttribute("result", result);
		model.addAttribute("CP_num", CP_num);
		return "carpool/cpAcceptResult";
	}
	
	// 타세요 드라이버 로그인 >> 매칭 여부 컬럼 "거절" 버튼 클릭시
	@RequestMapping("cpDenialResult")
	public String cpDenialResult(int CP_num, int MB_num, Model model) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		int result = rvs.updateDenial(reservation);
		model.addAttribute("result", result);
		model.addAttribute("CP_num", CP_num);
		return "carpool/cpDenialResult";
	}

}
