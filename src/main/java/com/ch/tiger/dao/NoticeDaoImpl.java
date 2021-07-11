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
	@Override
	public int getNtTotal(Notice notice) {
		return sst.selectOne("noticens.getNtTotal", notice);
	}
	@Override
	public List<Notice> noticeList(Notice notice) {
		return sst.selectList("noticens.noticeList", notice);
	}
	@Override
	public int noticeWrite(Notice notice) {
		return sst.insert("noticens.noticeWrite", notice);
	}
	@Override
	public int getMaxNum() {
		return sst.selectOne("noticens.getMaxNum");
	}
	
}
