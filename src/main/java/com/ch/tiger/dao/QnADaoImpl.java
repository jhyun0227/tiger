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

	public int getTotal(QnA qna) {
		return sst.selectOne("qnans.getTotal", qna);
	}

	public List<QnA> list(QnA qna) {
		return sst.selectList("qnans.list", qna);
	}

	public QnA select(int num) {
		return sst.selectOne("qnans.select", num);
	}

	public int getMaxNum() {
		return sst.selectOne("qnans.getMaxNum");
	}

	public void updateStep(QnA qna) {
		sst.update("qnans.updateStep", qna);
		
	}

	public int insert(QnA qna) {
		return sst.insert("qnans.insert", qna);
	}

	public int insertFile(QnA qna) {
		return sst.insert("qnans.insertFile", qna);
	}

	public int delete(int num) {
		return sst.update("qnans.delete", num);
	}

	public List<QnA> allQnaList(QnA qna) {
		return sst.selectList("qnans.allQnaList", qna);
	}

	public int getAllTotal(QnA qna) {
		return sst.selectOne("qnans.getAllTotal", qna);
	}

	public int adminQnaDelete(int num) {
		return sst.update("qnans.adminQnaDelete", num);
	}
}
