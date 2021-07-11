package com.ch.tiger.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Member;
@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public Member select(String MB_id) {	//회원 조회
		return sst.selectOne("memberns.select", MB_id);
	}
	@Override
	public int getMbTotal(Member member) {	// 회원 총 수 구하기
		return sst.selectOne("memberns.getMbTotal", member);
	}
	@Override
	public List<Member> list(Member member) {	// 회원 목록
		return sst.selectList("memberns.list", member);
	}
		
}
