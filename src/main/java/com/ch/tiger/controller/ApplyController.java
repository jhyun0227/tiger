package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.service.ApplyService;

@Controller
public class ApplyController {
	@Autowired
	private ApplyService as;
}
