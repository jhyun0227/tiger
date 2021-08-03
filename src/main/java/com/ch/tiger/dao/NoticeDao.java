package com.ch.tiger.dao;
import java.util.List;

import com.ch.tiger.model.Notice;
public interface NoticeDao {
	int getNtTotal(Notice notice); //공지사항 갯수 
	
	List<Notice> noticeList(Notice notice); //공지사항 목록
	
	int noticeWrite(Notice notice); //최신글 번호 
	
	int getMaxNum(); //공지사항 작성
	
	Notice select(int num); //공지사항 선택
	
	int noticeUpdate(Notice notice); //공지사항 수정
	
	int noticeDelete(int num); //공지사항 삭제
	
	List<Notice> noticeAllList(Notice notice); //관리자 메인 공지사항 목록

}