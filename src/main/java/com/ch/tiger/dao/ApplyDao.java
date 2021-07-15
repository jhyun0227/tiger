package com.ch.tiger.dao;

import com.ch.tiger.model.Apply;

public interface ApplyDao {
	Apply select(int MB_num); // 신청기록이 있는지 알기 위해
}
