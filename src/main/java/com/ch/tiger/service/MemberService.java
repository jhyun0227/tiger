package com.ch.tiger.service;

import com.ch.tiger.model.Member;

public interface MemberService {
	Member select(String MB_id); // 아이디로 정보를 가져오는 로직

	Member selectNick(String MB_nickName); // 닉네임 중복 체크

	int insert(Member member); // 회원가입

	Member selectFindId(Member member); // 아이디 찾기

	Member selectFindPw(Member member); // 비밀번호 찾기

	int update(Member member); // 회원정보 수정

	Member selectNum(int MB_num); // 프로필 상세

}
