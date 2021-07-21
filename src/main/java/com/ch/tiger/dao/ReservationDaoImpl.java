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
