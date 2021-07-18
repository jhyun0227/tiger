package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Member;

public interface MemberDao {
	Member select(String mb_id); // 회원가입 아이디 중복체크, 로그인할때 사용하는 로직
	Member selectNick(String mb_nickName); // 닉네임 중복체크
	int insert(Member member); // 회원정보 입력
	Member selectFindId(Member member); // 아이디 찾기
	Member selectFindPw(Member member); // 비밀번호 찾기
	int update(Member member); // 회원정보 수정
	Member selectNum(int MB_num); // 프로필 상세보기
	int getMbTotal(Member member);
	List<Member> mbList(Member member);
	int adminMbUpdate(Member member);
	int adminMbDelete(String MB_id);
	int adminMbRollback(String MB_id);	
}
