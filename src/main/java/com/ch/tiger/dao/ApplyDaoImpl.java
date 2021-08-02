package com.ch.tiger.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Apply;

@Repository
public class ApplyDaoImpl implements ApplyDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	// 관리자가 페이징을 위해 총갯수를 가져옴
	public int getApplyTotal(Apply apply) { 
		return sst.selectOne("applyns.getApplyTotal", apply); 
	}
	
	// 관리자가 드라이버 승인을 위한 목록
	public List<Apply> applyList(Apply apply) {
		return sst.selectList("applyns.applyList", apply); 
	}
	
	// 신청기록이 있는지 알기 위해
	public Apply select(int MB_num) {
		return sst.selectOne("applyns.select", MB_num); 
	}

	// 드라이버 신청
	public int insert(Apply apply) {
		return sst.insert("applyns.insert", apply); 
	}
	
	// 관리자가 운전면허사진, 회원정보 조회
	public Apply selectAll(int MB_num) {	
		return sst.selectOne("applyns.selectAll", MB_num);
	}
	
	@Override
	public int deleteAp(int MB_num) {
		return sst.delete("applyns.deleteAp", MB_num);
	}
	
	// 전체 신청 리스트 - 관리자메인
	public List<Apply> applyAllList(Apply apply) {
		return sst.selectList("applyns.applyAllList", apply);
	}
}
