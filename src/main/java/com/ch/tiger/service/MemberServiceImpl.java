package com.ch.tiger.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.tiger.dao.MemberDao;
import com.ch.tiger.model.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mbd;
	@Override
	public Member select(String MB_id) {
		return mbd.select(MB_id);
	}
	@Override
	public int getMbTotal(Member member) {
		return mbd.getMbTotal(member);
	}
	@Override
	public List<Member> mbList(Member member) {
		return mbd.mbList(member);
	}
	@Override
	public int adminMbUpdate(Member member) {
		return mbd.adminMbUpdate(member);
	}
	@Override
	public int adminMbDelete(String MB_id) {
		return mbd.adminMbDelete(MB_id);
	}
	@Override
	public int adminMbRollback(String MB_id) {
		return mbd.adminMbRollback(MB_id);
	}
	@Override
	public int adminPermit(int MB_num) {
		return mbd.adminPermit(MB_num);
	}
	
}
