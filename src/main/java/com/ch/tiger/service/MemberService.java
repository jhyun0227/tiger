package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Member;
public interface MemberService {
	Member select(String MB_id);
	int getMbTotal(Member member);
	List<Member> mbList(Member member);
	int adminMbUpdate(Member member);
	int adminMbDelete(String MB_id);
	int adminMbRollback(String MB_id);
	int adminPermit(int MB_num);
	int adminReject(int MB_num);
	
}
