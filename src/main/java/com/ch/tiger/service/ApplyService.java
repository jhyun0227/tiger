package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Apply;
public interface ApplyService {
	int getApplyTotal(Apply apply); // 관리자가 드라이버 신청 갯수를 알기 위함
	
	List<Apply> applyList(Apply apply); // 관리자가 드라이버 신청 리스트를 가져오기 위함

	Apply select(int MB_num); // 신청기록이 있는지 알기 위해

	int insert(Apply apply); // 신청 입력

	Apply selectAll(int MB_num);	// 관리자가 운전면허사진, 회원정보 조회

	int deleteAp(int MB_num);

	List<Apply> applyAllList(Apply apply); // 전체 신청 리스트 - 관리자메인

}
