package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Member;
public interface MemberService {
	Member select(String MB_id);
	int getMbTotal(Member member);
	List<Member> list(Member member);
	

}
