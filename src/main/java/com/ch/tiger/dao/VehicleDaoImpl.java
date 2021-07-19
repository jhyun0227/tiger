package com.ch.tiger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Vehicle;

@Repository
public class VehicleDaoImpl implements VehicleDao {
	@Autowired
	private SqlSessionTemplate sst;

	// 리스트
	@Override
	public List<Vehicle> list(int MB_num) {
		return sst.selectList("vehiclens.list", MB_num);
	}
	
	// 차 중복 확인
	@Override
	public Vehicle select(String VH_carNum) {
		return sst.selectOne("vehiclens.select", VH_carNum);
	}
	
	// 차 정보 등록
	@Override
	public int insert(Vehicle vehicle) {
		return sst.insert("vehiclens.insert", vehicle);
	}
	
	// 차 상세보기
	@Override
	public Vehicle select(int VH_num) {
		return sst.selectOne("vehiclens.selectNum", VH_num);
	}

	// 차량 삭제
	@Override
	public int delete(int VH_num) {
		return sst.update("vehiclens.delete", VH_num);
	}

	@Override
	public int deleteVh(int MB_num) {
		return sst.delete("vehiclens.deleteVh", MB_num);
	}

	@Override
	public Vehicle selectVh(int MB_num) {
		return sst.selectOne("vehiclens.selectVh", MB_num);
	}
	
	// 회원 탈퇴시 모든 차량 정보 삭제
	@Override
	public int deleteAll(int MB_num) {
		return sst.update("vehiclens.deleteAll", MB_num);
	}

	@Override
	public int rollbackAll(int MB_num) {
		return sst.update("vehiclens.rollbackAll", MB_num);
	}
}
