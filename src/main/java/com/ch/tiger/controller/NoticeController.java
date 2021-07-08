package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
}
