package com.ch.tiger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.CarpoolDao;
import com.ch.tiger.model.Carpool;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Autowired
	private CarpoolDao cpd;

	@Override
	public int insert(Carpool carpool) {
		return cpd.insert(carpool);
	}

	@Override
	public List<Carpool> carpoolList(Carpool carpool) {
		return cpd.carpoolList(carpool);
	}

	@Override
	public int getTotal(Carpool carpool) {
		return cpd.getTotal(carpool);
	}

	@Override
	public int getMaxNum() {
		return cpd.getMaxNum();
	}

	@Override
	public Carpool select(int CP_num) {
		return cpd.select(CP_num);
	}

	@Override
	public int getTotalMyRvs(Carpool carpool) {
		return cpd.getTotalMyRvs(carpool); // 예약 내역에서 페이징을 위해 내가 올린 글의 내역을 가져오는 로직 - 준호
	}

	@Override
	public List<Carpool> myCarpoolList(Carpool carpool) {
		return cpd.myCarpoolList(carpool); // 예약 내역에 내가 올린 글만 가져옴
	}
	
	@Override
	public int update(Carpool carpool) {
		return cpd.update(carpool);
	}

	@Override
	public int delete(int CP_num) {
		return cpd.delete(CP_num);
	}

	@Override
	public int updatePassNumNow(int CP_num) {
		return cpd.updatePassNumNow(CP_num);
	}

}
