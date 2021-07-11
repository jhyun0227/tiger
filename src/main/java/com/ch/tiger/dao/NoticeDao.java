package com.ch.tiger.dao;
import java.util.List;

import com.ch.tiger.model.Notice;
public interface NoticeDao {
	int getNtTotal(Notice notice);
	List<Notice> noticeList(Notice notice);
	int noticeWrite(Notice notice);
	int getMaxNum();	

}
