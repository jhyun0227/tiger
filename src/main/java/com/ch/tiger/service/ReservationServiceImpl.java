package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao rvd;
}
