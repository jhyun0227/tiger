package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Reservation;

public interface ReservationDao {
	List<Reservation> selectList(Reservation reservation); // 드라이버 예약 내역에서 리뷰 작성을 위해 본인의 글을 이용한 사람을 찾아내기 위함

	Reservation selectCp(int RSV_num); // 리뷰 작성 이후 다시 드라이버 예약내역 리스트를 불러오기 위해

	int getTotalMyRv(Reservation reservation); // 탑승자 예약내역에서 내가 신청한 글 개수를 불러오기

	List<Reservation> myRvList(Reservation reservation); // 탑승자 예약내역에서 내가 신청한 글 리스트를 불러오기

	int insert(Reservation reservation);

	List<Reservation> reservationList(Reservation reservation);

	int getTotal(int CP_num);

	int updateAccept(Reservation reservation);

	int updateDenial(Reservation reservation);

	List<Reservation> adminRvList(Reservation reservation);	// 관리자가 CP_num에 해당하는 카풀글 내 예약내역 - 동윤
	
	Reservation selectRv(Reservation reservation);

	int getTotalRv(Reservation reservation);	//추가 0723

	List<Reservation> adminRvAllList(Reservation reservation);	// 추가 0723

	int updateAllDeny(int CP_num); // 게시글 매칭완료시 기존에 신청된 수락버튼 거절로 변환

	int delete(Reservation reservation); // 매칭대기상태인 탑승자가 신청취소버튼 클릭시

}
