package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.MessageService;

@Controller
public class MessageController {
	@Autowired
	private MessageService msg;
}
