package com.ch.tiger.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.tiger.model.Member;
import com.ch.tiger.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mbs;

	// 회원가입 폼으로 이동
	@RequestMapping("joinForm")
	public String joinForm() {
		return "member/joinForm";
	}

	// 아이디 중복체크 할때 사용하는 로직
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

	// 닉네임 중복체크
	@RequestMapping(value = "nickChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문으로 전달
	public String nickChk(String MB_nickName) {
		String msg = "";
		Member member = mbs.selectNick(MB_nickName);
		if (member == null) {
			msg = "사용 가능 한 닉네임입니다.";
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
			result = 1;
			model.addAttribute("member", member2);
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "member/findPwResult";
	}
	
}
