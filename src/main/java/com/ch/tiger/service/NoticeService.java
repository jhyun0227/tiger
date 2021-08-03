package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Notice;
public interface NoticeService {
	int getNtTotal(Notice notice); //공지사항 갯수 
	
	List<Notice> noticeList(Notice notice); //공지사항 목록
	
	int getMaxNum(); //최신글 번호 
	
	int noticeWrite(Notice notice); //공지사항 작성
	
	Notice select(int num); //공지사항 선택
	
	int noticeUpdate(Notice notice); //공지사항 수정
	
	int noticeDelete(int num); //공지사항 삭제
	
	List<Notice> noticeAllList(Notice notice); //관리자 메인 공지사항 목록
}
