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

	// 회원별 qna 총 갯수 
	public int getTotal(QnA qna) {
		return qad.getTotal(qna);
	}

	// 회원별 qna 리스트
	public List<QnA> list(QnA qna) {
		return qad.list(qna);
	}

	// qna 선택
	public QnA select(int num) {
		return qad.select(num);
	}

	// qna 마지막 번호
	public int getMaxNum() {
		return qad.getMaxNum();
	}

	// qna 답변 작성
	public void updateStep(QnA qna) {
		qad.updateStep(qna);
	}

	// qna 작성
	public int insert(QnA qna) {
		return qad.insert(qna);
	}

	// qna 첨부파일 작성
	public int insertFile(QnA qna) {
		return qad.insertFile(qna);
	}

	// 게시글 삭제
	public int delete(int num) {
		return qad.delete(num);
	}

	// qna 리스트 - 관리자
	public List<QnA> allQnaList(QnA qna) {
		return qad.allQnaList(qna);
	}

	// qna 전체 갯수 - 관리자
	public int getAllTotal(QnA qna) {
		return qad.getAllTotal(qna);
	}

	// qna 리스트 - 관리자메인
	public List<QnA> qnaAllList(QnA qna) {
		return qad.qnaAllList(qna);
	}
}
