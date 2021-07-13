package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Vehicle;

public interface VehicleDao {
	List<Vehicle> list(int MB_num); // 리스트

	Vehicle select(String VH_carNum); // 차 중복확인
	
	int insert(Vehicle vehicle); // 차 정보 등록
	
	int delete(int VH_num); // 차량 삭제
}
