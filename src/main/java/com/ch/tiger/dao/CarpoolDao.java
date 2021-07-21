package com.ch.tiger.dao;

import java.util.List;
import java.util.Map;

import com.ch.tiger.model.Carpool;

public interface CarpoolDao{

	int insert(Carpool carpool);

	List<Carpool> carpoolList(Carpool carpool);

	int getTotal(Carpool carpool);

	int getMaxNum();

	Carpool select(int CP_num);

	int getTotalMyRvs(Carpool carpool); // 예약 내역에서 페이징을 위해 내가 올린 글을 가져오는 로직 - 준호

	List<Carpool> myCarpoolList(Carpool carpool); // 예약 내역에 내가 올린 글만 가져옴

	
	
	
	
	
}
