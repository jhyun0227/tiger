package com.ch.tiger.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.tiger.dao.NoticeDao;
import com.ch.tiger.model.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nd;
	
	//공지사항 갯수 
	public int getNtTotal(Notice notice) {
		return nd.getNtTotal(notice);
	}
	
	//공지사항 목록
	public List<Notice> noticeList(Notice notice) {
		return nd.noticeList(notice);
	}
	
	//최신글 번호 
	public int noticeWrite(Notice notice) {
		return nd.noticeWrite(notice);
	}
	
	//공지사항 작성
	public int getMaxNum() {
		return nd.getMaxNum();
	}
	
	//공지사항 선택
	public Notice select(int num) {
		return nd.select(num);
	}
	
	//공지사항 수정
	public int noticeUpdate(Notice notice) {
		return nd.noticeUpdate(notice);
	}
	
	//공지사항 삭제
	public int noticeDelete(int num) {
		return nd.noticeDelete(num);
	}
	
	//관리자 메인 공지사항 목록
	public List<Notice> noticeAllList(Notice notice) {
		return nd.noticeAllList(notice);
	}
	
}
