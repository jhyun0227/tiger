package com.ch.tiger.service;

import java.util.List;

import com.ch.tiger.model.Carpool;

public interface CarpoolService {

	int insert(Carpool carpool);

	List<Carpool> cpList(Carpool carpool);

	int getTotal(Carpool carpool);

	int getMaxNum();

	Carpool select(int CP_num);

	int getTotalMyRvs(Carpool carpool); // 예약 내역에서 페이징을 위해 내가 올린 글의 개수를 가져오는 로직 - 준호

	List<Carpool> myCarpoolList(Carpool carpool); // 예약 내역에서 내가 올린 글들만 가져옴 - 준호
	int update(Carpool carpool);

	int delete(int CP_num);

	int adminCpDelete(int CP_num);	// 관리자가 신고 내역에 해당하는 카풀 글 삭제 - 동윤

	int adminCpRollback(int CP_num);	// 관리자가 신고 내역에 해당하는 카풀 글 복구 - 동윤

	List<Carpool> adminCpList(Carpool carpool);	// 관리자 카풀 목록 - 동윤
	
	int updatePassNumNow(int CP_num);


}
