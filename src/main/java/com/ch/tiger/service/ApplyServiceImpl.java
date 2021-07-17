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
	
	@Override
	public int getApplyTotal(Apply apply) {
		return ad.getApplyTotal(apply); // 관리자가 드라이버 신청 갯수를 알기 위함
	}
	
	@Override
	public List<Apply> applyList(Apply apply) {
		return ad.applyList(apply); // 관리자가 드라이버 신청 리스트를 알기 위함
	}

	@Override
	public Apply select(int MB_num) {
		return ad.select(MB_num); // 신청기록이 있는지 알기 위해
	}

	@Override
	public int insert(Apply apply) { // 신청 입력
		return ad.insert(apply);
	}
}
