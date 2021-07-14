package com.ch.tiger;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.tiger.model.Member;
import com.ch.tiger.service.MemberService;
@Controller
public class HomeController {
	@Autowired
	private MemberService mbs;
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
//		String MB_id = (String)session.getAttribute("MB_id");
//		Member member = null;
//		if(MB_id != null && !MB_id.equals("")) {
//			member = mbs.select(MB_id);
//			model.addAttribute("member", member);
//			if(MB_id.equals("admin")) {
//				
//				return "admin/adminMain";
//			}
//		}
//		model.addAttribute("member", member);
		return "main/main";
	}
	@RequestMapping("adminMain")
	public String adminMain(Model model, HttpSession session) {
//		String MB_id = (String)session.getAttribute("MB_id");
//		Member member = null;
//		if(MB_id != null && !MB_id.equals("")) {
//			member = mbs.select(MB_id);
//			if(MB_id.equals("admin")) {
//				model.addAttribute("member", member);
//				return "admin/adminMain";
//			}
//		}
//		model.addAttribute("member", member);
		return "admin/adminMain";
	}
}