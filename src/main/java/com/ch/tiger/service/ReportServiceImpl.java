package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ReportDao;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDao rpd;
}
