package com.ch.tiger.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.tiger.dao.ApplyDao;
import com.ch.tiger.model.Apply;

@Service
public class ApplyServiceImpl implements ApplyService {
	@Autowired
	private ApplyDao ad;
	
	// 관리자가 드라이버 신청 갯수를 알기 위함
	public int getApplyTotal(Apply apply) {
		return ad.getApplyTotal(apply); 
	}
	
	// 관리자가 드라이버 신청 리스트를 알기 위함
	public List<Apply> applyList(Apply apply) {
		return ad.applyList(apply); 
	}

	// 신청기록이 있는지 알기 위해
	public Apply select(int MB_num) {
		return ad.select(MB_num);
	}

	// 신청 입력
	public int insert(Apply apply) { 
		return ad.insert(apply);
	}

	// 관리자가 운전면허사진, 회원정보 조회
	public Apply selectAll(int MB_num) {
		return ad.selectAll(MB_num);	
	}

	@Override
	public int deleteAp(int MB_num) {
		return ad.deleteAp(MB_num);
	}

	// 전체 신청 리스트 - 관리자메인
	public List<Apply> applyAllList(Apply apply) {
		return ad.applyAllList(apply);
	}
}
