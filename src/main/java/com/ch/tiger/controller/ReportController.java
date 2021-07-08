package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService rps;
}
