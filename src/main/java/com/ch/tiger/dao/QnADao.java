package com.ch.tiger.dao;

import java.util.List;
import com.ch.tiger.model.QnA;

public interface QnADao {

	int getTotal(QnA qna); // 회원별 qna 총 갯수 
	
	List<QnA> list(QnA qna); // 회원별 qna 리스트
	
	QnA select(int num); // qna 선택
	
	int getMaxNum(); // qna 마지막 번호
	
	void updateStep(QnA qna); // qna 답변 작성
	
	int insert(QnA qna); // qna 작성
	
	int insertFile(QnA qna); // qna 첨부파일 작성
	
	int delete(int num); //	게시글 삭제
	
	List<QnA> allQnaList(QnA qna); // qna 리스트 - 관리자
	
	int getAllTotal(QnA qna); // qna 전체 갯수 - 관리자

	List<QnA> qnaAllList(QnA qna); // qna 리스트 - 관리자메인
}
