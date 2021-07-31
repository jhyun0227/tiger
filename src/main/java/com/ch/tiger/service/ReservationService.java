package com.ch.tiger.service;

import java.util.List;

import com.ch.tiger.model.Reservation;

public interface ReservationService {
	List<Reservation> selectList(Reservation reservation); // 드라이버 예약 내역에서 리뷰 작성을 위해 본인의 글을 이용한 사람을 찾아내기 위함

	Reservation selectCp(int RSV_num); // 리뷰 작성 이후 다시 드라이버 예약내역 리스트를 불러오기 위해

	int getTotalMyRv(Reservation reservation); // 탑승자 예약내역에서 페이징을 위해 내가 신청한 글 개수를 불러오기

	List<Reservation> myRvList(Reservation reservation); // 탑승자 예약내역에서 내가 신청한 글 리스트를 불러오기
	
	int insert(Reservation reservation); // 타세요 매칭 게시글 상세보기 신청 버튼 클릭

	List<Reservation> reservationList(Reservation reservation);

	int getTotal(int CP_num);	// CP_num에 해당하는 예약내역 행 갯수 - 동윤

	int updateAccept(Reservation reservation); // 드라이버 타세요 수락 버튼

	int updateDenial(Reservation reservation); // 드라이버 타세요 거절 버튼

	Reservation selectRv(Reservation reservation); // 타세요 신청 중복 방지

	List<Reservation> adminRvList(Reservation reservation);	// 관리자가 CP_num에 해당하는 카풀글 내 예약내역 - 동윤

	int getTotalRv(Reservation reservation);	// 추가 0723

	List<Reservation> adminRvAllList(Reservation reservation);	//추가 0723

	int updateAllDeny(int CP_num); // 게시글 매칭완료시 기존에 신청된 수락버튼 거절로 변환

	int delete(Reservation reservation); // 매칭대기상태인 탑승자가 신청취소버튼 클릭시

	List<Reservation> rvAllList(Reservation reservation);  // 전체 예약내역 리스트 - 관리자메인

}
