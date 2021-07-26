package com.ch.tiger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ReservationDao;
import com.ch.tiger.model.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao rvd;

	@Override
	public List<Reservation> selectList(Reservation reservation) {
		return rvd.selectList(reservation); // 드라이버 예약 내역에서 리뷰 작성을 위해 본인의 글을 이용한 사람을 찾아내기 위함
	}

	@Override
	public Reservation selectCp(int RSV_num) {
		return rvd.selectCp(RSV_num); // 리뷰 작성 이후 다시 드라이버 예약내역 리스트를 불러오기 위해
	}

	@Override
	public int getTotalMyRv(Reservation reservation) {
		return rvd.getTotalMyRv(reservation); // 탑승자 예약내역에서 페이징을 위해 예약한 글 개수를 불러오기
	}

	@Override
	public List<Reservation> myRvList(Reservation reservation) {
		return rvd.myRvList(reservation); // 탑승자 예약내역에서 내가 신청한 글 리스트를 불러오기
	}

	public int insert(Reservation reservation) {
		return rvd.insert(reservation);
	}

	@Override
	public List<Reservation> reservationList(Reservation reservation) {
		return rvd.reservationList(reservation);
	}

	@Override
	public int getTotal(int CP_num) {
		return rvd.getTotal(CP_num);
	}

	@Override
	public int updateAccept(Reservation reservation) {
		return rvd.updateAccept(reservation);
	}

	@Override
	public int updateDenial(Reservation reservation) {
		return rvd.updateDenial(reservation);
	}

	@Override
	public List<Reservation> adminRvList(Reservation reservation) {
		return rvd.adminRvList(reservation);	// 관리자가 CP_num에 해당하는 카풀글 내 예약내역 - 동윤
	}

	@Override
	public int getTotalRv(Reservation reservation) {	//추가 0723
		return rvd.getTotalRv(reservation);
	}

	@Override
	public List<Reservation> adminRvAllList(Reservation reservation) {	// 추가0723
		return rvd.adminRvAllList(reservation);
	}
	
	@Override
	public Reservation selectRv(Reservation reservation) { // 타세요 신청 중복 방지
		return rvd.selectRv(reservation);
	}

}
