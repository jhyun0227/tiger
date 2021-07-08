package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ApplyDao;

@Service
public class ApplyServiceImpl implements ApplyService {
	@Autowired
	private ApplyDao ad;
}
