package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.CarpoolService;

@Controller
public class CarpoolController {
	@Autowired
	private CarpoolService cs;
}
