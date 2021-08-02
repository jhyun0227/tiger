package com.ch.tiger.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.tiger.model.QnA;

@Repository
public class QnADaoImpl implements QnADao {
	@Autowired
	private SqlSessionTemplate sst;

	// 회원별 qna 총 갯수 
	public int getTotal(QnA qna) {
		return sst.selectOne("qnans.getTotal", qna);
	}

	// 회원별 qna 리스트
	public List<QnA> list(QnA qna) {
		return sst.selectList("qnans.list", qna);
	}

	// qna 선택
	public QnA select(int num) {
		return sst.selectOne("qnans.select", num);
	}

	// qna 마지막 번호
	public int getMaxNum() {
		return sst.selectOne("qnans.getMaxNum");
	}

	// qna 답변 작성
	public void updateStep(QnA qna) {
		sst.update("qnans.updateStep", qna);
	}

	// qna 작성
	public int insert(QnA qna) {
		return sst.insert("qnans.insert", qna);
	}

	// qna 첨부파일 작성
	public int insertFile(QnA qna) {
		return sst.insert("qnans.insertFile", qna);
	}

	//	게시글 삭제
	public int delete(int num) {
		return sst.update("qnans.delete", num);
	}

	// qna 리스트 - 관리자
	public List<QnA> allQnaList(QnA qna) {
		return sst.selectList("qnans.allQnaList", qna);
	}

	// qna 전체 갯수 - 관리자
	public int getAllTotal(QnA qna) {
		return sst.selectOne("qnans.getAllTotal", qna);
	}

	// qna 삭제 - 관리자
	public int adminQnaDelete(int num) {
		return sst.update("qnans.adminQnaDelete", num);
	}
	
	// qna 리스트 - 관리자메인
	public List<QnA> qnaAllList(QnA qna) {
		return sst.selectList("qnans.qnaAllList", qna);
	}
}
