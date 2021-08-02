package com.ch.tiger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.QnADao;
import com.ch.tiger.model.QnA;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADao qad;

	public int getTotal(QnA qna) {
		return qad.getTotal(qna);
	}

	public List<QnA> list(QnA qna) {
		return qad.list(qna);
	}

	public QnA select(int num) {
		return qad.select(num);
	}

	public int getMaxNum() {
		return qad.getMaxNum();
	}

	public void updateStep(QnA qna) {
		qad.updateStep(qna);
	}

	public int insert(QnA qna) {
		return qad.insert(qna);
	}

	public int insertFile(QnA qna) {
		return qad.insertFile(qna);
	}

	public int delete(int num) {
		return qad.delete(num);
	}

	public List<QnA> allQnaList(QnA qna) {
		return qad.allQnaList(qna);
	}

	public int getAllTotal(QnA qna) {
		return qad.getAllTotal(qna);
	}

	public int adminQnaDelete(int num) {
		return qad.adminQnaDelete(num);
	}
}
