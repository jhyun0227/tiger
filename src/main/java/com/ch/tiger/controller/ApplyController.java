package com.ch.tiger.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Apply;
import com.ch.tiger.model.Member;
import com.ch.tiger.service.ApplyService;
import com.ch.tiger.service.MemberService;

@Controller
public class ApplyController {
	@Autowired
	private ApplyService as;
	@Autowired
	private MemberService mbs;

	// 드라이버 신청으로 이동
	@RequestMapping("driverApplyForm")
	public String driverApplyForm(Model model, HttpSession session) {
		int result = 0;
		
		// 멤버 객체에서 apply 테이블을 검색하기 위해 mb_num값을 가져온다.
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		
		Apply apply = as.select(MB_num);
		// 신청 기록이 없거나 driverConfirm 값이 N이면 result=1 값을 가짐
		if (apply == null || member.getMB_driverConfirm().equals("N") || member.getMB_driverConfirm() == "N") {
			result = 1;
			model.addAttribute("member", member);
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "apply/driverApplyForm";
	}
}
