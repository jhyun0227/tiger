package com.ch.tiger.dao;
import java.util.List;

import com.ch.tiger.model.Apply;
public interface ApplyDao {
	int getApplyTotal(Apply apply); // 관리자에서 필요한 게시글 총 갯수 알아내기(페이징)
	
	List<Apply> applyList(Apply apply); // 관리자에서 승인하기 위해 리스트를 가져오는 로직

	Apply select(int MB_num); // 신청기록이 있는지 알기 위해

	int insert(Apply apply); // 신청 입력

	Apply selectAll(int MB_num);	// 관리자가 운전면허사진, 회원정보 조회
}
