package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Notice;
public interface NoticeService {
	int getNtTotal(Notice notice);
	List<Notice> noticeList(Notice notice);
	int getMaxNum();
	int noticeWrite(Notice notice);
	Notice select(int num);
	int noticeUpdate(Notice notice);
	int noticeDelete(int num);	

}
