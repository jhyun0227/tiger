package com.ch.tiger.service;

import java.util.List;

import com.ch.tiger.model.Message;

public interface MessageService {
	int insert(Message msg);
	int getTotal(Message msg);
	List<Message> recieveList(Message msg);
	void delete(int MSG_num);
	int getSendTotal(Message msg);
	List<Message> sendList(Message msg);
	Message select(int mSG_num);

}
