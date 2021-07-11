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
	@Override
	public int getNtTotal(Notice notice) {
		return nd.getNtTotal(notice);
	}
	@Override
	public List<Notice> noticeList(Notice notice) {
		return nd.noticeList(notice);
	}
	@Override
	public int noticeWrite(Notice notice) {
		return nd.noticeWrite(notice);
	}
	@Override
	public int getMaxNum() {
		return nd.getMaxNum();
	}
	
}
