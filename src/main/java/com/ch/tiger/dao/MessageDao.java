package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Message;

public interface MessageDao {
	//쪽지 입력
	int insert(Message msg);
	
	//쪽지 선택
	Message select(int MSG_num);
	
	//받은쪽지 갯수
	int getTotalR(Message msg);
	
	//보낸쪽지 갯수
	int getTotalS(Message msg);
	
	//받은쪽지함
	List<Message> recieveList(Message msg);

	//보낸쪽지함
	List<Message> sendList(Message msg);
	
	//받은쪽지 삭제
	void deleteS(int MSG_num);
	
	//보낸쪽지 삭제
	void deleteR(int MSG_num);
}
