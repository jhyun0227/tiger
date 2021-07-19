package com.ch.tiger.service;

import java.util.List;

import com.ch.tiger.model.Vehicle;

public interface VehicleService {
	List<Vehicle> list(int MB_num); // 리스트

	Vehicle select(String VH_carNum); // 차 중복확인
	
	int insert(Vehicle vehicle); // 차 정보 등록
	
	Vehicle select(int VH_num); // 차 상세보기를 위해 검색
	
	int delete(int VH_num); // 차량 삭제

	int deleteVh(int MB_num);	// 관리자가 드라이버 반려 시 차량도 삭제
	
	int deleteAll(int MB_num); // 회원 탈퇴시 모든 차량 기록 삭제

	Vehicle selectVh(int MB_num);	// 관리자가 드라이버 승인 View에서 차량정보 조회

	int rollbackAll(int MB_num);	// 관리자가 회원 복구 시 차량 관련 정보 모두 복구

}
