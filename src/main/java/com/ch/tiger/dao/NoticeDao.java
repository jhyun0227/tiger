package com.ch.tiger.dao;
import java.util.List;

import com.ch.tiger.model.Notice;
public interface NoticeDao {
	int getNtTotal(Notice notice);
	List<Notice> noticeList(Notice notice);
	int noticeWrite(Notice notice);
	int getMaxNum();
	Notice select(int num);
	int noticeUpdate(Notice notice);
	int noticeDelete(int num);	

}
