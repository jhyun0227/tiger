package com.ch.tiger.service;

import java.util.List;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Report;

public interface ReportService {

	int RPinsert(Report report);

	int getMaxNum();

	int getRpTotal(Report report);

	List<Report> rpList(Report report);

	int adminRpDelete(int RP_num);	// 관리자 신고 내역 삭제 - 동윤

}
