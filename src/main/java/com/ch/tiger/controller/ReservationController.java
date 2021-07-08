package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService rvs;
}
