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

	// 전체 신고내역 갯수
	public int getRpTotal(Report report) {
		return rpd.getRpTotal(report);
	}

	// 관리자 신고 목록
	public List<Report> rpList(Report report) {
		return rpd.rpList(report);
	}

	// 관리자 신고 내역 삭제
	public int adminRpDelete(int RP_num) {
		return rpd.adminRpDelete(RP_num);	
	}

	// 전체 신고 리스트 - 관리자메인
	public List<Report> rpAllList(Report report) {
		return rpd.rpAllList(report);
	}

}
