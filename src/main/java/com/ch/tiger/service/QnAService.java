package com.ch.tiger.service;

import java.util.List;
import com.ch.tiger.model.QnA;

public interface QnAService {

	int getTotal(QnA qna);
	List<QnA> list(QnA qna);
	QnA select(int num);
	int getMaxNum();
	void updateStep(QnA qna);
	int insert(QnA qna);
	int insertFile(QnA qna);
	int delete(int num);
	List<QnA> allQnaList(QnA qna);
	int getAllTotal(QnA qna);
}