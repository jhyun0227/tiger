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
		String msg="";
		Member member = mbs.select(MB_id);
		if (member == null) {
			msg = "사용 가능 한 이메일 입니다.";
		} else {
			msg = "이미 사용중인 이메일 입니다.";
		}
		return msg;
	}
	
	// 회원가입 로직
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = 0;
		// form 에서 입력한 member데이터를 가져와서 member2 객체에 대입하여 아이디가 존재하는지 확인
		Member member2 = mbs.select(member.getMB_id());
		
		return null;
	}
	
	
	// 로그인 폼으로 이동
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 로그인
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) { // 로그인
		int result = 0;
		Member member2 = mbs.select(member.getMB_id()); // 아이디를 검색하는데 매개변수를 id로 한다.
		if (member2 != null || member2.getMB_del().equals("n")) {
			if (member2.getMB_pw().equals(member.getMB_pw())) {
				session.setAttribute("id", member.getMB_id());
				result = 1; // member2가 null이아니고 del이 n일때 두 객체의 비밀번호가 동일하면 1
			} else {
				result = 0; // 비밀번호가 다르면  0
			}
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "member/memberMain";
	}
}
