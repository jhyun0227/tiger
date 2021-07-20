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
	public int insert(Reservation reservation) {
		return rvd.insert(reservation);
	}

	@Override
	public List<Reservation> reservationList(Reservation reservation) {
		return rvd.reservationList(reservation);
	}

	@Override
	public int getTotal(Reservation reservation) {
		return rvd.getTotal(reservation);
	}
}
