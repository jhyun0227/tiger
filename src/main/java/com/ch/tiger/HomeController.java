package com.ch.tiger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
}