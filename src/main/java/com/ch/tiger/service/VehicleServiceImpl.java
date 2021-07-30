package com.ch.tiger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.VehicleDao;
import com.ch.tiger.model.Vehicle;

@Service
public class VehicleServiceImpl implements VehicleService {
	@Autowired
	private VehicleDao vd;

	// 리스트
	@Override
	public List<Vehicle> list(int MB_num) {
		return vd.list(MB_num);
	}

	// 차 중복확인
	@Override
	public Vehicle select(String VH_carNum) {
		return vd.select(VH_carNum);
	}
	
	// 차 정보 등록
	@Override
	public int insert(Vehicle vehicle) {
		return vd.insert(vehicle);
	}
	
	// 차 상세보기
	@Override
	public Vehicle select(int VH_num) {
		return vd.select(VH_num);
	}
	
	// 차량 삭제
	@Override
	public int delete(int VH_num) {
		return vd.delete(VH_num);
	}
	
	// 회원 탈퇴 시 모든 차량 정보 삭제
	@Override
	public int deleteAll(int MB_num) {
		return vd.deleteAll(MB_num);
	}

	@Override
	public int deleteVh(int MB_num) {
		return vd.deleteVh(MB_num);
	}

	@Override
	public Vehicle selectVh(int MB_num) {
		return vd.selectVh(MB_num);
	}

	@Override
	public int rollbackAll(int MB_num) {
		return vd.rollbackAll(MB_num);
	}

	// 관리자가 삭제된 차량정보 복구
	public int adminVhRollback(int VH_num) {
		return vd.adminVhRollback(VH_num);
	}

}
