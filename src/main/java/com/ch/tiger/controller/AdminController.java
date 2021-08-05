package com.ch.tiger.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ch.tiger.model.Vehicle;
import com.ch.tiger.service.ApplyService;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.NoticeService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.QnAService;
import com.ch.tiger.service.ReportService;
import com.ch.tiger.service.ReservationService;
import com.ch.tiger.service.VehicleService;
@Controller
public class AdminController {
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
	@Autowired
	private VehicleService vs;
	
	@RequestMapping("adminNoticeList")
	public String adminNoticeList(Member member, Model model, Notice notice, HttpSession session, String pageNum) {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -3); //3일간 보이기
		String nowday = simpleDate.format(cal.getTime());
		// 처음 notice에는 null로 받아오고, startRow, endRow 보내주기 위한 용도
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = ns.getNtTotal(notice);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		List<Notice> noticeList = ns.noticeList(notice);	// 공지사항 목록
		int num = total - startRow + 1;		// 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"제목", "내용", "제목+내용"};	// 작성자는 관리자뿐이므로 제외
		String MB_id = (String)session.getAttribute("MB_id");
		Member memberDB = mbs.select(MB_id);
		model.addAttribute("nowday", nowday);
		model.addAttribute("memberDB", memberDB);	// 아이디로 DB에 있는 회원정보 조회
		model.addAttribute("title", title);	// 검색 기능
		model.addAttribute("MB_id", MB_id);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("noticeList", noticeList);		// 공지사항 검색 시 공지사항번호 발생
		model.addAttribute("num", num);	// 목록 번호 생성 위한 num
		return "admin/adminNoticeList";
	}
	@RequestMapping("adminNoticeView")
	public String noticeView(int NT_num, String pageNum, Model model, HttpSession session) {
		Notice notice = ns.select(NT_num);
		String MB_id = (String)session.getAttribute("MB_id");
		Member memberDB = mbs.select(MB_id);
		model.addAttribute("memberDB", memberDB);	// 아이디로 DB에 있는 회원정보 조회
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeView";
	}
	@RequestMapping("adminMbList")
	public String adminMbList(Member member, String pageNum, Model model) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1" ;
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = mbs.getMbTotal(member);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> mbList = mbs.mbList(member);	// 회원 목록
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"아이디", "이름", "닉네임", "성별", "가입일"};
		
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("mbList", mbList);
		model.addAttribute("num", num);	//목록 번호 생성 위한 num
		return "admin/adminMbList";
	}
	@RequestMapping("adminMbView")
	public String adminMbView(String MB_id, String pageNum, Model model) {
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		List<Vehicle> vcList = vs.list(MB_num);	// 회원 차량 정보
		model.addAttribute("vcList", vcList);
		model.addAttribute("member", member);	// 아이디로 DB에 있는 회원정보 조회
		model.addAttribute("pageNum", pageNum);
		return "admin/adminMbView";
	}
	@RequestMapping("adminMbUpdateForm")
	public String adminMbUpdateForm(String MB_id, String pageNum, Model model) {
		Member member = mbs.select(MB_id);
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminMbUpdateForm";
	}
	@RequestMapping("adminMbUpdateResult")
	public String adminMbUpdateResult(Member member, String MB_id, String pageNum, Model model) {
		int result = mbs.adminMbUpdate(member);
		model.addAttribute("member", member);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminMbUpdateResult";
	}
	@RequestMapping("adminVehicleDelete")
	public String adminVehicleDelete(int VH_num, String MB_id, String pageNum, Model model) {
		int result = vs.delete(VH_num);
		model.addAttribute("result", result);
		model.addAttribute("MB_id", MB_id);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminVehicleDelete";
	}
	@RequestMapping("adminMbDelete")
	public String adminMbDelete(String MB_id, String pageNum, Model model) {
		int result = mbs.adminMbDelete(MB_id);
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		if(result == 1) {
			int resultVh = vs.deleteAll(MB_num);
			model.addAttribute("resultVh", resultVh);
		}
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminMbDelete";
	}
	@RequestMapping("adminMbRollback")
	public String adminMbRollback(String MB_id, String pageNum, Model model) {
		int result = mbs.adminMbRollback(MB_id);
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		if(result == 1) {
			int resultVh = vs.rollbackAll(MB_num);
			model.addAttribute("resultVh", resultVh);
		}
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminMbRollback";
	}
	@RequestMapping("adminNoticeWriteForm")
	public String noticeWriteForm(int NT_num, String pageNum, Model model) {
		model.addAttribute("NT_num", NT_num);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeWriteForm";
	}
	@RequestMapping("adminNoticeWriteResult")
	public String noticeWrite(Member member, int NT_num, Notice notice, String pageNum,
			Model model, HttpSession session) {
		int number = ns.getMaxNum();	// 공지사항 번호 생성 용도
		session.setAttribute("MB_num", member.getMB_num());
//		notice.setMB_num(MB_num);
		notice.setNT_num(number);
		int result = ns.noticeWrite(notice);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeWriteResult";
	}
	@RequestMapping("adminNoticeUpdateForm")
	public String noticeUpdateForm(int NT_num, String pageNum, Model model, HttpSession session) {
		Notice notice = ns.select(NT_num);
		String MB_id = (String)session.getAttribute("MB_id");
		Member memberDB = mbs.select(MB_id);
		model.addAttribute("memberDB", memberDB);	// 아이디로 DB에 있는 회원정보 조회
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeUpdateForm";
	}
	@RequestMapping("adminNoticeUpdateResult")
	public String noticeUpdate(Notice notice, String pageNum, Model model) {
		int result = ns.noticeUpdate(notice);
		model.addAttribute("notice", notice);	// 공지사항 수정 후 view로 넘어갈 때 데이터 필요
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeUpdateResult";
	}
	@RequestMapping("adminNoticeDelete")
	public String noticeDelete(int NT_num, String pageNum, Model model, HttpSession session) {
		int result = ns.noticeDelete(NT_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeDelete";
	}
	@RequestMapping("adminQnaList")
	public String adminQnaList(QnA qna, String pageNum, Model model) {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -3); //3일간 보이기
		String nowday = simpleDate.format(cal.getTime());
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;		//나중에 수정
		int total = qas.getAllTotal(qna);	// 전체 문의내역 갯수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		List<QnA> allQnaList = qas.allQnaList(qna);
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"제목", "작성자", "내용", "제목+내용"};
		model.addAttribute("title", title);	// 검색 기능
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("allQnaList", allQnaList);
		model.addAttribute("nowday", nowday);
		return "admin/adminQnaList";
	}
	@RequestMapping("adminQnaView")
	public String adminQnaView(int num, String pageNum, Model model) {
		QnA qna = qas.select(num);
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminQnaView";
	}
	@RequestMapping("adminQnaDelete")
	public String adminQnaDelete(int num, String pageNum, Model model) {
		int result = qas.adminQnaDelete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminQnaDelete";
	}
	@RequestMapping("adminQnaReplyForm")
	public String adminQnaReplyForm(int num, String pageNum, Model model) {
		int QA_ref = 0, QA_refLevel = 0, QA_refStep = 0;
		String QA_title ="";
		//답변글
		if(num!=0) {
			QnA qna = qas.select(num);
			QA_ref = qna.getQA_ref();
			QA_refStep = qna.getQA_refStep();
			QA_refLevel = qna.getQA_refLevel();
			QA_title = qna.getQA_title();
		}
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("QA_ref", QA_ref);
		model.addAttribute("QA_refLevel", QA_refLevel);
		model.addAttribute("QA_refStep", QA_refStep);
		model.addAttribute("QA_title", QA_title);

		return "admin/adminQnaReplyForm";
	}
	@RequestMapping("adminQnaReplyResult")
	public String adminQnaReplyResult(QnA qna, String pageNum, Model model, HttpSession session) throws IOException {
		int result = 0;
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		qna.setMB_num(MB_num);
		int number = qas.getMaxNum();
		if(qna.getQA_num()!=0) {
			qas.updateStep(qna);
			qna.setQA_refLevel(qna.getQA_refLevel()+1);
			qna.setQA_refStep(qna.getQA_refStep()+1);
		} else qna.setQA_ref(number);
		qna.setQA_num(number);
		if (!qna.getFile().isEmpty()){
			String fileName = qna.getFile().getOriginalFilename();
			int index = fileName.lastIndexOf(".");
			String ext = fileName.substring(index);
			UUID uuid = UUID.randomUUID();
			fileName = uuid+ext;
			System.out.println("fileName = " +fileName);			
			qna.setQA_fileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(qna.getFile().getBytes());
			fos.close();	
			result = qas.insertFile(qna);
		} else {
			result = qas.insert(qna);
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "admin/adminQnaReplyResult";
	}
	@RequestMapping("adminPermitList")
	public String adminPermitList(Apply apply, String pageNum, Model model) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = as.getApplyTotal(apply);		// 전체 신청 갯수
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		apply.setStartRow(startRow);
		apply.setEndRow(endRow);
		List<Apply> applyList = as.applyList(apply);	// 공지사항 목록
		int num = total - startRow + 1;		// 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
//		String[] title = {"아이디", "차량번호", "차량연식", "차종"};
		String[] title = {"아이디", "이름", "성별", "승인상태"};
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("applyList", applyList);
		model.addAttribute("num", num);	//목록 번호 생성 위한 num
		return "admin/adminPermitList";
	}
	@RequestMapping("adminPermitView")
	public String adminApplyView(int MB_num, String pageNum, Model model) {
		// 운전면허사진 & 회원정보 조회
		Apply apply = as.selectAll(MB_num);
		Vehicle vehicle = vs.selectVh(MB_num);
		model.addAttribute("vehicle", vehicle);
		model.addAttribute("apply", apply);
		model.addAttribute("pageNum", pageNum);
		// view에서 마이페이지처럼 주민번호 등 회원정보를 모두 갖고 올지 apply model 데이터만 갖고 올지
		// 차량정보도 포함시켜야함
		return "admin/adminPermitView";
	}
	@RequestMapping("adminPermitResult")
	public String adminPermitResult(int MB_num, String pageNum, Model model) {
		int result = mbs.adminPermit(MB_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminPermitResult";
	}
	@RequestMapping("adminRejectResult")
	public String adminRejectResult(int MB_num, String pageNum, Model model) {
		int result = mbs.adminReject(MB_num);
		if (result == 1) {
			int resultAp = as.deleteAp(MB_num);
			int resultVh = vs.deleteVh(MB_num);
			model.addAttribute("resultAp", resultAp);
			model.addAttribute("resultVh", resultVh);
		}
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminRejectResult";
	}
	@RequestMapping("adminReportList")
	public String adminReportList(Report report, String pageNum, Model model) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		} 
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = rps.getRpTotal(report);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		report.setStartRow(startRow);
		report.setEndRow(endRow);
		List<Report> rpList = rps.rpList(report);	// 신고 목록
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
//		String[] title = {"작성자", "신고자", "신고사유"};
		String[] title = {"신고자", "신고사유"};		// 신고일 추가 할까?말까?
//		for(Report rt :rpList) {
//			Member member3 = mbs.selectNum(rt.getMB_num());
//			String MB_nickName = member3.getMB_nickName();	// 글 작성자id
//			Member member4 = mbs.selectNum(rt.getMB_numR());
//			String RP_nickName = member4.getMB_nickName();	// 신고자id
//			rt.setMB_nickName(MB_nickName);		//model에 추가
//			rt.setRP_nickName(RP_nickName);		//model에 추가
//		}
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("rpList", rpList);
		model.addAttribute("num", num);	//목록 번호 생성 위한 num
		return "admin/adminReportList";
	}
	@RequestMapping("adminCpDelete")
	public String adminCpDelete(int CP_num, String pageNum, Model model) {
		int result = cps.adminCpDelete(CP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminCpDelete";
	}
	@RequestMapping("adminCpRollback")
	public String adminCpRollback(int CP_num, String pageNum, Model model) {
		int result = cps.adminCpRollback(CP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminCpRollback";
	}
	@RequestMapping("adminRpDelete")
	public String adminRpDelete(int RP_num, String pageNum, Model model) {
		int result = rps.adminRpDelete(RP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminRpDelete";
	}
	@RequestMapping("adminRvList")
	public String adminRvList(Reservation reservation, String pageNum, Model model) {	// Carpool carpool
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
		return "admin/adminRvList";	// 수정 0723
	}
	@RequestMapping("adminRvView")
	public String adminRvView(int CP_num, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member memberDB = mbs.select(MB_id);
		Reservation reservation = new Reservation();
		int num = rvs.getTotal(CP_num);
		reservation.setCP_num(CP_num);	// CP_num에 해당하는 예약내역
		List<Reservation> adminRvList = rvs.adminRvList(reservation);
		Carpool carpool = cps.select(CP_num);
		Member member = mbs.selectNum(carpool.getMB_num());
		model.addAttribute("member", member);	// 타세요 글 작성자 정보
		model.addAttribute("memberDB", memberDB);	// 로그인한 관리자 정보
		model.addAttribute("carpool", carpool);	// 데이터 출력을 위한 객체
		model.addAttribute("adminRvList", adminRvList);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminRvView";
	}
	@RequestMapping("adminCpView")
	public String adminCpView(int CP_num, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member memberDB = mbs.select(MB_id);
		Reservation reservation = new Reservation();
		int num = rvs.getTotal(CP_num);
		reservation.setCP_num(CP_num);	// CP_num에 해당하는 예약내역
		List<Reservation> adminRvList = rvs.adminRvList(reservation);
		Carpool carpool = cps.select(CP_num);
		Member member = mbs.selectNum(carpool.getMB_num());
		model.addAttribute("member", member);	// 타세요 글 작성자 정보
		model.addAttribute("memberDB", memberDB);	// 로그인한 관리자 정보
		model.addAttribute("carpool", carpool);	// 데이터 출력을 위한 객체
		model.addAttribute("adminRvList", adminRvList);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminCpView";
	}
	@RequestMapping("adminCpList")
	public String adminCpList(Carpool carpool, String pageNum, Model model) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		} 
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = cps.getTotal(carpool);	//추가 0729
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		carpool.setStartRow(startRow);
		carpool.setEndRow(endRow);
		List<Carpool> adminCpList = cps.adminCpList(carpool);
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"작성자", "출발지", "도착지", "출발일", "출발시간"};
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);
		model.addAttribute("num", num);
		model.addAttribute("adminCpList", adminCpList);
		return "admin/adminCpList";
	}
	
	@RequestMapping("adminVhRollback")
	public String adminVhRollback(int VH_num, Model model, HttpServletRequest request) {
		int result = vs.adminVhRollback(VH_num);
		String prevUrl = request.getHeader("Referer");
		model.addAttribute("result", result);
		model.addAttribute("prevUrl", prevUrl);
		return "admin/adminVhRollback";
	}
}
