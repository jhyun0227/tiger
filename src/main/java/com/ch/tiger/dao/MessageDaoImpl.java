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

	public int insert(Message msg) {
		return sst.insert("messagens.insert", msg);
	}

	public int getTotal(Message msg) {
		return sst.selectOne("messagens.getTotal", msg);
	}

	public List<Message> recieveList(Message msg) {
		return sst.selectList("messagens.recieveList", msg);
	}

	public void delete(int MSG_num) {
		sst.update("messagens.delete",MSG_num);
	}

	public int getSendTotal(Message msg) {
		return sst.selectOne("messagens.getSendTotal",msg);
	}

	public List<Message> sendList(Message msg) {
		return sst.selectList("messagens.sendList", msg);
	}

	public Message select(int MSG_num) {
		return sst.selectOne("messagens.select", MSG_num);
	}
}
