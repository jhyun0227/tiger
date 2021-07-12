package com.ch.tiger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.service.CarpoolService;

@Controller
public class CarpoolController {
	@Autowired
	private Carpool cs;
	
	@RequestMapping(value="cpWriteForm", method=RequestMethod.POST)
	public String create(Carpool dto, Model model){
		model.addAttribute("carpool",dto);
		return "/carpool/cpWriteForm";
	}
}
