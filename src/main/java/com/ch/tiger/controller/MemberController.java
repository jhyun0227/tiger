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
		int result = 0;
		Member member2 = mbs.select(member.getMB_id());
		if (member2 == null || member2.getMB_del().equals("y")) {
			result = -1; // 없는 아이디
		} else if (member2.getMB_pw().equals(member.getMB_pw())) {
			result = 1; // 성공 id와 password 일치
			session.setAttribute("id", member.getmeId());
		}
		model.addAttribute("result", result);
		return "login/memberMain";
	}
}
