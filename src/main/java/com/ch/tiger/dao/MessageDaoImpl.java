package com.ch.tiger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Message;

@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	//쪽지 입력
	public int insert(Message msg) {
		return sst.insert("messagens.insert", msg);
	}
	
	//쪽지 선택
	public Message select(int MSG_num) {
		return sst.selectOne("messagens.select", MSG_num);
	}
	
	//받은쪽지 갯수
	public int getTotalR(Message msg) {
		return sst.selectOne("messagens.getTotalR", msg);
	}
	
	//보낸쪽지 갯수
	public int getTotalS(Message msg) {
		return sst.selectOne("messagens.getTotalS",msg);
	}

	//받은쪽지함
	public List<Message> recieveList(Message msg) {
		return sst.selectList("messagens.recieveList", msg);
	}

	//보낸쪽지함
	public List<Message> sendList(Message msg) {
		return sst.selectList("messagens.sendList", msg);
	}

	//받은쪽지 삭제
	public void deleteR(int MSG_num) {
		sst.update("messagens.deleteR", MSG_num);	
	}
	
	//보낸쪽지 삭제
	public void deleteS(int MSG_num) {
		sst.update("messagens.deleteS", MSG_num);	
	}

}
