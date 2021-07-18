package com.ch.tiger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.MessageDao;
import com.ch.tiger.model.Message;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao msd;

	public int insert(Message msg) {
		return msd.insert(msg);
	}

	public int getTotal(Message msg) {
		return msd.getTotal(msg);
	}

	public List<Message> recieveList(Message msg) {
		return msd.recieveList(msg);
	}

	public void delete(int MSG_num) {
		msd.delete(MSG_num);
	}

	public int getSendTotal(Message msg) {
		return msd.getSendTotal(msg);
	}

	public List<Message> sendList(Message msg) {
		return msd.sendList(msg);
	}

	public Message select(int MSG_num) {
		return msd.select(MSG_num);
	}
}
