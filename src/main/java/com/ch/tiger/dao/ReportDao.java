package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Report;

public interface ReportDao {

	int getMaxNum();

	int RPinsert(Report report);

	int getRpTotal(Report report);

	List<Report> rpList(Report report);	//관리자 신고 목록


}
