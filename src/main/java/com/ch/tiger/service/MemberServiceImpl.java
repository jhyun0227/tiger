package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.MemberDao;
import com.ch.tiger.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mbd;

	@Override
	public Member select(String MB_id) { // 회원가입 아이디 중복체크, 로그인할때 사용하는 로직
		return mbd.select(MB_id);
	}

	@Override
	public Member selectNick(String MB_nickName) { // 닉네임 중복체크
		return mbd.selectNick(MB_nickName);
	}

	@Override
	public int insert(Member member) { // 회원가입
		return mbd.insert(member);
	}

	@Override
	public Member selectFindId(Member member) { // 아이디  찾기
		return mbd.selectFindId(member);
	}

	@Override
	public Member selectFindPw(Member member) { // 비밀번호 찾기
		return mbd.selectFindPw(member);
	}

	@Override
	public int update(Member member) { // 회원정보 수정
		return mbd.update(member);
	}

	@Override
	public Member selectNum(int MB_num) { // 프로필 상세
		return mbd.selectNum(MB_num);
	}
}
