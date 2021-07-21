package com.ch.tiger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Reservation> selectList(Reservation reservation) {
		return sst.selectList("reservationns.selectList", reservation); // 드라이버 예약 내역에서 리뷰 작성을 위해 본인의 글을 이용한 사람을 찾아내기 위함
	}

	@Override
	public Reservation selectCp(int RSV_num) {
		return sst.selectOne("reservationns.selectCp", RSV_num); // 리뷰 작성 이후 다시 드라이버 예약내역 리스트를 불러오기 위해
	}

	@Override
	public int getTotalMyRv(Reservation reservation) {
		return sst.selectOne("reservationns.getTotalMyRv", reservation); // 탑승자 예약내역에서 내가 신청한 글 개수를 불러오기
	}

	@Override
	public List<Reservation> myRvList(Reservation reservation) {
		return sst.selectList("reservationns.myRvList", reservation); // 탑승자 예약내역에서 내가 신청한 글 리스트를 불러오기
	}

	public int insert(Reservation reservation) {
		return sst.insert("reservationns.insert", reservation);
	}

	@Override
	public List<Reservation> reservationList(Reservation reservation) {
		return sst.selectList("reservationns.reservationList", reservation);
	}

	@Override
	public int getTotal(Reservation reservation) {
		return sst.selectOne("reservationns.getTotal", reservation);
	}

	@Override
	public int updateAccept(Reservation reservation) {
		return sst.update("reservationns.updateAccept", reservation);
	}

	@Override
	public int updateDenial(Reservation reservation) {
		return sst.update("reservationns.updateDenial", reservation);
	}

}
