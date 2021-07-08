package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.CarpoolDao;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Autowired
	private CarpoolDao cd;
}
