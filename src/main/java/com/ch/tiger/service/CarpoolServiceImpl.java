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

}
