package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.QnADao;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADao qad;
}
