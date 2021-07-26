package com.ch.tiger.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.tiger.model.Favorite;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Review;
import com.ch.tiger.service.FavoriteService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.ReviewService;
import com.ch.tiger.service.VehicleService;
@Controller
public class MemberController {
	@Autowired
	private MemberService mbs;
	@Autowired
	private VehicleService vs;
	@Autowired
	private ReviewService rs;
	@Autowired
	private FavoriteService fs;
	@Autowired
	private JavaMailSender jMailSender;

	// 회원가입 폼으로 이동
	@RequestMapping("joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 아이디 중복체크 할때 사용
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문으로 전달
	public String idChk(String MB_id) {
		String msg = "";
		Member member = mbs.select(MB_id);
		if (member == null) {
			msg = "사용가능한 이메일 입니다.";
		} else {
			msg = "이미 사용중인 이메일 입니다.";
		}
		return msg;
	}

	// 이메일 인증
	@RequestMapping(value = "mailResult", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String mailResult(String MB_id, Model model) {
		String msg = ""; // 코드를 담아 보낼 메세지
		String code=""; // 코드 생성
		
		// 난수 생성
		Random random = new Random();
		for(int i=0; i<3; i++) {
			int index = random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
			code += (char)index;
		}
		int numIndex = random.nextInt(9999)+1000; //4자리 랜덤 정수 생성
		code += numIndex;		
		msg = (String)code;  //메시지 내용 함수입력
				
		MimeMessage mm = jMailSender.createMimeMessage();
		try {
			MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "utf-8");
			mmh.setSubject("이메일 인증번호 입니다.");
			mmh.setText("인증번호 : " + msg);
			System.out.println("msg"+msg);
			mmh.setTo(MB_id);
			mmh.setFrom("email@Email.com");
			jMailSender.send(mm);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}		
		return msg;
	}

	// 닉네임 중복체크
	@RequestMapping(value = "nickChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문으로 전달
	public String nickChk(String MB_nickName) {
		String msg = "";
		Member member = mbs.selectNick(MB_nickName);
		if (member == null) {
			msg = "사용가능한 닉네임입니다.";
		} else {
			msg = "이미 사용중인 닉네임입니다.";
		}
		return msg;
	}
	
	// 마이페이지에서 닉네임 중복체크
		@RequestMapping(value = "nickChkMy", produces = "text/html;charset=utf-8")
		@ResponseBody // jsp로 가지말고 바로 본문으로 전달
		public String nickChkMy(Member member) {
			String msg = "";
			Member member2 = mbs.selectNickMy(member);
			if (member2 != null) {
				msg = "사용가능한 닉네임입니다."; // 기존에 사용중인 닉네임이라서 사용이 가능
			} else {
				Member member3 = mbs.selectNick(member.getMB_nickName());
				if (member3 == null) {
					msg = "사용가능한 닉네임입니다."; // 기존에 사용중이지 않으면서 아무도 사용하지 않음
				} else {
					msg = "이미 사용중인 닉네임입니다."; // 누군가 사용중
				}
			}
			return msg;
		}

	// 회원가입 로직
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = 0;
		// form 에서 입력한 member데이터를 가져와서 member2 객체에 대입하여 아이디가 존재하는지 확인
		Member member2 = mbs.select(member.getMB_id());
		if (member2 == null) {
			result = mbs.insert(member);
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "member/joinResult";
	}

	// 로그인 폼으로 이동
	@RequestMapping("loginForm")
	public String loginForm(HttpServletRequest request, Model model) {
		String prevUrl = request.getHeader("Referer");
		System.out.println(prevUrl);
		prevUrl = prevUrl.substring(28);
		System.out.println("prev:"+prevUrl);
		model.addAttribute("prevUrl", prevUrl);
		return "member/loginForm";
	}

	// 로그인
	@RequestMapping("login")
	public String login(String prevUrl, Member member, Model model, HttpSession session) {
		// memberDB ; DB 데이터
		Member memberDB = mbs.select(member.getMB_id());
		int result = 0; // 암호가 일치하지 않는 경우
		if (memberDB == null || memberDB.getMB_del().equals("Y")) {
			result = -1; // DB에 없는 아이디
		} else if (memberDB.getMB_pw().equals(member.getMB_pw())) {
			result = 1;
			session.setAttribute("MB_id", member.getMB_id());
			session.setAttribute("MB_num", memberDB.getMB_num());
			session.setAttribute("MB_nickName", memberDB.getMB_nickName());	//header출력용
		}
		model.addAttribute("result", result);
		model.addAttribute("prevUrl", prevUrl);
		return "member/loginResult";
	}
	
	// 로그 아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	
	// 아이디 찾기 폼으로 이동
	@RequestMapping("findIdForm")
	public String findIdForm() {
		return "member/findIdForm";
	}
	
	// 아이디 찾기
	@RequestMapping("findIdResult")
	public String findIdResult(Member member, Model model) {
		int result = 0;
		Member member2 = mbs.selectFindId(member);
		if (member2 != null) {
			result = 1;
			model.addAttribute("member", member2);
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "member/findIdResult";
	}
	
	// 비밀번호 찾기 폼으로 이동
	@RequestMapping("findPwForm")
	public String findPwForm(String MB_id, Model model) {
		// 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함
		model.addAttribute("MB_id", MB_id);
		return "member/findPwForm";
	}
	
	// 비밀번호 찾기
	@RequestMapping("findPwResult")
	public String findPwResult(Member member, Model model) {
		int result = 0;
		Member member2 = mbs.selectFindPw(member);
		if (member2 != null) {
			// 아이디가 존재 할 때 결과 값 1을 반영
			result = 1;
			model.addAttribute("member", member2);
			
			// 난수 생성
			String msg = "";
			String code = "";
			Random random = new Random();
			for(int i=0; i<3; i++) {
				int index = random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
				code += (char)index;
			}
			int numIndex = random.nextInt(9999)+1000; //4자리 랜덤 정수 생성
			code += numIndex;		
			msg = (String)code;  //메시지 내용 함수입력
					
			MimeMessage mm = jMailSender.createMimeMessage();
			try {
				MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "utf-8");
				mmh.setSubject("타이거 임시비밀번호 입니다.");
				mmh.setText("임시비밀번호 : " + msg);
				mmh.setTo(member.getMB_id());
				mmh.setFrom("jhyun0227@naver.com");
				jMailSender.send(mm);
				
				// 이메일이 성공적으로 보내졌으면 멤버 비밀번호를 변경
				member.setMB_pw(msg);
				int resultUpdatePw = mbs.updatePw(member);
				model.addAttribute("resultUpdatePw", resultUpdatePw);
				
			} catch (Exception e) {
				result = 0;
				model.addAttribute("msg", e.getMessage());
			}		
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "member/findPwResult";
	}
	
	// 마이페이지 메인으로 이동
	@RequestMapping("myMain")
	public String myMain(Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		model.addAttribute("member", member);
		return "mypage/myMain";
	}
	 
	// 마이페이지 회원정보 수정폼으로 이동
	@RequestMapping("updateForm")
	public String updateForm(Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		model.addAttribute("member", member);
		return "mypage/updateForm";
	}
	
	// 마이페이지 회원정보 수정
	@RequestMapping("updateResult")
	public String updateResult(Member member, Model model, HttpSession session) throws IOException {
		// 사진을 리소스 폴더에 저장하기 위한 로직
		String fileName1 = member.getFile().getOriginalFilename();
		if (fileName1 != null && !fileName1.equals("")) {
			UUID uuid = UUID.randomUUID(); // 파일이름이 겹치지 않게 하기 위함
			String fileName = uuid+"_"+fileName1;
			// 파일을 리소스 폴더에 저장
			String real = session.getServletContext().getRealPath("/resources/memberImg");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
			// 정보를 수정
			member.setMB_img(fileName);
		}	
		
		int result = mbs.update(member);
		
		model.addAttribute("result", result);
		return "mypage/updateResult";
	}
	
	// 비밀번호 변경 폼으로 이동
	@RequestMapping("updatePw")
	public String updatePw(Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		model.addAttribute("member", member);
		return "mypage/updatePw";
	}
	
	// 비밀번호 변경
	@RequestMapping("updatePwResult")
	public String updatePwResult(Member member, Model model) {
		int result = mbs.updatePw(member);
		model.addAttribute("result", result);
		return "mypage/updatePwResult";
	}
		
	// 마이페이지 회원 탈퇴
	@RequestMapping("delete")
	public String delete(Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		
		int result = mbs.delete(MB_id);
		if (result == 1) {
			session.invalidate();
			int resultVh = vs.deleteAll(MB_num);
			model.addAttribute("resultVh", resultVh);
		}
		model.addAttribute("result", result);
		return "mypage/delete";  
	}
	
	// 프로필 상세보기
	@RequestMapping("profileView")
	public String profileView(String MB_nickName, HttpSession session, Model model) {
		int result = 0;
		int favo = 0; // 좋아요 확인
		int MB_num = (int) session.getAttribute("MB_num"); // 좋아요 확인을 위해 로그인 계정의 mb_num을 가져옴
		
		Member member = mbs.selectNick(MB_nickName); // 선택한 계정의 정보를 가져옴
		if (member.getMB_del() == "Y") { // 회원 탈퇴 처리 되어있는지 확인
			result = 0; // 회원 탈퇴 처리가 되어있음
		} else {
			result = 1; // 회원 탈퇴 처리가 안되있을 경우
			// 후기 리스트 가져오기
			List<Review> rvList = rs.selectMb(member.getMB_num()); // 후기 리스트를 가져옴
			// 리뷰 평점 구하기
			float reviewAvg = rs.selectAvg(member.getMB_num()); // 회원의 리뷰 평균 평점을 가져옴			
			model.addAttribute("rvList", rvList); // 리뷰 리스트
			model.addAttribute("reviewAvg", reviewAvg); // 평균 평점
			
			// 로그인 계정과 프로필 계정을 조회하여 favorite 테이블에 행이 있는지 조사
			Favorite favorite = new Favorite();
			favorite.setMB_numG(MB_num);
			favorite.setMB_numT(member.getMB_num());
			Favorite favorite2 = fs.select(favorite); // 두 개의 계정의 번호를 객체에 담아 조회
			if (favorite2 != null) {
				favo = 1; // 정보 검색 결과가 있으면 1 반환
			} else {
				favo = 0; // 정보 검색 결과가 없으면 0 반환
			}
			model.addAttribute("favo", favo);
		}
		model.addAttribute("result", result); // 회원 탈퇴 여부 확인
		model.addAttribute("member", member); // 프로필에서 회원정보 입력하기 위해서
		return "nolayout/profileView";
	}
}
