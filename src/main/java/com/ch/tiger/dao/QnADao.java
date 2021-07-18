package com.ch.tiger.dao;

import java.util.List;
import com.ch.tiger.model.QnA;

public interface QnADao {
	int getTotal(QnA qna);
	List<QnA> list(QnA qna);
	QnA select(int num);
	int getMaxNum();
	void updateStep(QnA qna);
	int insert(QnA qna);
	int insertFile(QnA qna);
	int delete(int num);
}
