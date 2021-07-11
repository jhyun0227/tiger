package com.ch.tiger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Member select(String mb_id) {
		return sst.selectOne("memberns.select", mb_id); // 로그인할 때 사용하는 로직
	}

	@Override
	public Member selectNick(String mb_nickName) {
		return sst.selectOne("memberns.selectNick", mb_nickName); // 닉네임 중복 체크
	}

	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert", member); // 회원가입
	}

	@Override
	public Member selectFindId(Member member) {
		return sst.selectOne("memberns.selectFindId", member);
	}

	@Override
	public Member selectFindPw(Member member) {
		return sst.selectOne("memberns.selectFindPw", member);
	}

	@Override
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}
	
}
