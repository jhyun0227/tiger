package com.ch.tiger.service;

import java.util.List;

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

	@Override
	public int getRpTotal(Report report) {
		return rpd.getRpTotal(report);
	}

	@Override
	public List<Report> rpList(Report report) {
		return rpd.rpList(report);
	}

	@Override
	public int adminRpDelete(int RP_num) {
		return rpd.adminRpDelete(RP_num);	// 관리자 신고 내역 삭제 - 동윤
	}

}
