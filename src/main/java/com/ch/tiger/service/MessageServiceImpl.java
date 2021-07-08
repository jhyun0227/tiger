package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.MessageDao;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao msd;
}
