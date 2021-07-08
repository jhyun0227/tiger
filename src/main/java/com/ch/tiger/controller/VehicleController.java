package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.tiger.service.VehicleService;

@Controller
public class VehicleController {
	@Autowired
	private VehicleService vs;
}
