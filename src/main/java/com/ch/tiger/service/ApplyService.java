package com.ch.tiger.service;

import com.ch.tiger.model.Apply;

public interface ApplyService {
	Apply select(int MB_num); // 신청기록이 있는지 알기 위해

	int insert(Apply apply); // 신청 입력

}
