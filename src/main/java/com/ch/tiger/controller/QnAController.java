package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService qas;
}
