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

	//쪽지 입력
	public int insert(Message msg) {
		return msd.insert(msg);
	}
	
	//쪽지 선택
	public Message select(int MSG_num) {
		return msd.select(MSG_num);
	}

	//받은쪽지 갯수
	public int getTotalR(Message msg) {
		return msd.getTotalR(msg);
	}
	
	//보낸쪽지 갯수
	public int getTotalS(Message msg) {
		return msd.getTotalS(msg);
	}
	
	//받은쪽지함
	public List<Message> recieveList(Message msg) {
		return msd.recieveList(msg);
	}

	//보낸쪽지함
	public List<Message> sendList(Message msg) {
		return msd.sendList(msg);
	}

	//받은쪽지 삭제
	public void deleteR(int MSG_num) {
		msd.deleteR(MSG_num);
	}

	//보낸쪽지 삭제
	public void deleteS(int MSG_num) {
		msd.deleteS(MSG_num);
	}

}
