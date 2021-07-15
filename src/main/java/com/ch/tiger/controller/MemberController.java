package com.ch.tiger.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Member;
import com.ch.tiger.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mbs;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "login/loginForm";
	}
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		// memberDB ; DB 데이터
		Member memberDB = mbs.select(member.getMB_id());
		int result = 0;	// 암호가 일치하지 않는 경우
		if(memberDB == null || memberDB.getMB_del().equals("Y")) {
			result = -1;	// DB에 없는 아이디
		} else if(memberDB.getMB_pw().equals(member.getMB_pw())) {
			result = 1;
			session.setAttribute("MB_id", member.getMB_id());
		}
		model.addAttribute("result", result);
		return "login/login";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/logout";
	}
}
