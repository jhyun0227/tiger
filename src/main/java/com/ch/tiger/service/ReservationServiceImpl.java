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
	public int getTotalMyRvs(Reservation reservation) {
		return rvd.getTotalMyRvs(reservation); // 탑승자 예약내역에서 내가 신청한 글 리스트를 불러오기
	}


}
