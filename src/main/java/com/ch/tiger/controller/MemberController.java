package com.ch.tiger.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.tiger.model.Email;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Vehicle;
import com.ch.tiger.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mbs;
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
			msg = "사용 가능 한 이메일 입니다.";
		} else {
			msg = "이미 사용중인 이메일 입니다.";
		}
		return msg;
	}

//	이메일 인증
//	@RequestMapping(value = "emailChk", produces = "text/html;charset=utf-8")
//	@ResponseBody
//	public String emailChk(String MB_id, Email email, Model model) {
//		String msg = ""; // 내용에 들어갈 메세지
//		Member member = mbs.select(MB_id);
//		// 중복이 없는 이메일
//		if (member == null) {
//			String code=""; // 인증코드
//			// 난수 생성
//			Random random = new Random();
//			for(int i=0; i<3; i++) {
//				int index = random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
//				code += (char)index;
//			}
//			int numIndex = random.nextInt(9999)+1000; //4자리 랜덤 정수 생성
//			code += numIndex;		
//			msg = (String)code;  //메시지 내용 함수입력
//					
//			MimeMessage mm = jMailSender.createMimeMessage();
//			try {
//				MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "utf-8");
//				mmh.setSubject("타이거 인증번호 입니다.");
//				mmh.setText("인증번호 : " + msg);
//				mmh.setTo(MB_id);
//				mmh.setFrom("jhyun0227@naver.com");
//				jMailSender.send(mm);
//				model.addAttribute("msg", "인증번호를 입력해주세요.");
//				model.addAttribute("key", msg);
//			} catch (Exception e) {
//				model.addAttribute("msg", e.getMessage());
//			}		
//		} else {
//			msg = "이미 사용중인 이메일 입니다.";
//		}
//		return msg;
//	}

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
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그인
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		// memberDB ; DB 데이터
		Member memberDB = mbs.select(member.getMB_id());
		int result = 0; // 암호가 일치하지 않는 경우
		if (memberDB == null || memberDB.getMB_del().equals("Y")) {
			result = -1; // DB에 없는 아이디
		} else if (memberDB.getMB_pw().equals(member.getMB_pw())) {
			result = 1;
			session.setAttribute("MB_id", member.getMB_id());
		}
		model.addAttribute("result", result);
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
		UUID uuid = UUID.randomUUID(); // 파일이름이 겹치지 않게 하기 위함
		String fileName = uuid+"_"+fileName1;
		// 파일을 리소스 폴더에 저장
		String real = session.getServletContext().getRealPath("/resources/memberImg");
		FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
		fos.write(member.getFile().getBytes());
		fos.close();
		
		// 정보를 수정
		member.setMB_img(fileName);
		int result = mbs.update(member);
		
		model.addAttribute("result", result);
		return "mypage/updateResult";
	}
	
	// 좋아요 카테고리에서 프로필 상세보기
	@RequestMapping("profileView")
	public String profileView(int MB_num, Model model) {
		Member member = mbs.selectNum(MB_num);
		model.addAttribute("member", member);
		return "member/profileView";
	}
}
