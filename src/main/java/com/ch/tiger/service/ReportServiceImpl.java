package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ReportDao;
import com.ch.tiger.model.Report;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDao rpd;

	@Override
	public int RPinsert(Report report) {
		return rpd.RPinsert(report);
	}

	@Override
	public int getMaxNum() {
		return rpd.getMaxNum();
	}

}
