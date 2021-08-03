package com.ch.tiger.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.tiger.model.Notice;
@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	//공지사항 갯수
	public int getNtTotal(Notice notice) {
		return sst.selectOne("noticens.getNtTotal", notice);
	}
	
	//공지사항 목록
	public List<Notice> noticeList(Notice notice) {
		return sst.selectList("noticens.noticeList", notice);
	}
	
	//공지사항 작성 
	public int noticeWrite(Notice notice) {
		return sst.insert("noticens.noticeWrite", notice);
	}
	
	//최신글 번호 
	public int getMaxNum() {
		return sst.selectOne("noticens.getMaxNum");
	}
	
	//공지사항 선택
	public Notice select(int num) {
		return sst.selectOne("noticens.select", num);
	}
	
	//공지사항 수정
	public int noticeUpdate(Notice notice) {
		return sst.update("noticens.noticeUpdate", notice);
	}
	
	//공지사항 삭제
	public int noticeDelete(int num) {
		return sst.update("noticens.noticeDelete", num);
	}
	
	//관리자 메인 공지사항 목록
	public List<Notice> noticeAllList(Notice notice) {
		return sst.selectList("noticens.noticeAllList", notice);
	}
}
