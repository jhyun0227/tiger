package com.ch.tiger.service;

import java.util.List;

import com.ch.tiger.model.Report;

public interface ReportService {

	int RPinsert(Report report);

	int getMaxNum();

	int getRpTotal(Report report);

	List<Report> rpList(Report report);

}
