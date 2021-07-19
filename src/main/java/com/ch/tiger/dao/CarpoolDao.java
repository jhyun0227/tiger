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

	int update(Carpool carpool);

	int delete(int CP_num);

	
	
	
	
	
}
