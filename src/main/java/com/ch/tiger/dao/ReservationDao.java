package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Reservation;

public interface ReservationDao {

	int insert(Reservation reservation);

	List<Reservation> reservationList(Reservation reservation);

	int getTotal(Reservation reservation);

}
