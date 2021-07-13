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

}