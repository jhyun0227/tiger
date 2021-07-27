package com.ch.tiger.dao;

import java.util.List;
import java.util.Map;

import com.ch.tiger.model.Carpool;

public interface CarpoolDao{

	int insert(Carpool carpool);

	List<Carpool> cpList(Carpool carpool);

	int getTotal(Carpool carpool);

	int getMaxNum();

	Carpool select(int CP_num);

	int getTotalMyRvs(Carpool carpool); // 예약 내역에서 페이징을 위해 내가 올린 글을 가져오는 로직 - 준호

	List<Carpool> myCarpoolList(Carpool carpool); // 예약 내역에 내가 올린 글만 가져옴

	int update(Carpool carpool);

	int delete(int CP_num);

	int adminCpDelete(int CP_num);	// 관리자가 신고 내역에 해당하는 카풀 글 삭제 - 동윤	

	int adminCpRollback(int CP_num);	// 관리자가 신고 내역에 해당하는 카풀 글 복구 - 동윤

	List<Carpool> adminCpList(Carpool carpool);	// 관리자 카풀 목록 - 동윤

	int updatePassNumNow(int CP_num);	// 현재 매칭완료된 좌석 수
	
	
	
	
	
}
