package com.ch.tiger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getMaxNum() {
		return sst.selectOne("reportns.getMaxNum");
	}

	@Override
	public int RPinsert(Report report) {
		return sst.insert("reportns.RPinsert", report);
	}

	// 전체 신고내역 갯수
	public int getRpTotal(Report report) {
		return sst.selectOne("reportns.getRpTotal", report);
	}

	// 관리자 신고 목록
	public List<Report> rpList(Report report) {
		return sst.selectList("reportns.rpList", report);
	}

	// 관리자 신고 내역 삭제
	public int adminRpDelete(int RP_num) {	
		return sst.update("reportns.adminRpDelete", RP_num);
	}

	// 전체 신고 리스트 - 관리자메인
	public List<Report> rpAllList(Report report) {
		return sst.selectList("reportns.rpAllList", report);
	}
	


}
