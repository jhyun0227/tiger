package com.ch.tiger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.service.MemberService;
@Controller
public class HomeController {
	@Autowired
	private MemberService mbs;
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}

	@RequestMapping("adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
}