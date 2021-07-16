package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ApplyDao;
import com.ch.tiger.model.Apply;

@Service
public class ApplyServiceImpl implements ApplyService {
	@Autowired
	private ApplyDao ad;

	@Override
	public Apply select(int MB_num) {
		return ad.select(MB_num); // 신청기록이 있는지 알기 위해
	}

	@Override
	public int insert(Apply apply) { // 신청 입력
		return ad.insert(apply);
	}
}
