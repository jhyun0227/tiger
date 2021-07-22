package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Report;

public interface ReportDao {

	int getMaxNum();

	int RPinsert(Report report);

	int getRpTotal(Report report);

	List<Report> rpList(Report report);	//관리자 신고 목록

	int adminRpDelete(int RP_num);	// 관리자 신고 내역 삭제 - 동윤


}
