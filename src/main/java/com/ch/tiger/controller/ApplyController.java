package com.ch.tiger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApplyController {
	@RequestMapping("/main/main.do")
	public String main() {
		return "main/main";
	}
}
