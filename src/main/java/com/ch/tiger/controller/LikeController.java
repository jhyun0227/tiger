package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.LikeService;

@Controller
public class LikeController {
	@Autowired
	private LikeService ls;
}
