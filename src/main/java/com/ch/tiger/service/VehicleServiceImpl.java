package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.VehicleDao;

@Service
public class VehicleServiceImpl implements VehicleService {
	@Autowired
	private VehicleDao vd;
}
