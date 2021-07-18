package com.ch.tiger.dao;
import java.util.List;

import java.util.List;

import com.ch.tiger.model.Member;
public interface MemberDao {
	int getMbTotal(Member member); // 관리자가 회원 수를 불러옴
	
	List<Member> mbList(Member member); // 관리자가 회원 목록을 불러옴
	
	int adminMbUpdate(Member member); // 관리자가 회원 정보를 수정
	
	int adminMbDelete(String MB_id); // 관리자가 회원 정보를 삭제
	
	int adminMbRollback(String MB_id); // 관리자가 회원 정보를 복구
	
	int adminPermit(int MB_num); // 관리자가 드라이버 신청을 수락함
	
	int adminReject(int MB_num); // 관리자가 드라이버 신청을 거절함

	Member select(String MB_id); // 회원가입 아이디 중복체크, 로그인할때 사용하는 로직

	Member selectNick(String MB_nickName); // 닉네임 중복체크
	
	Member selectNickMy(Member member); // 마이페이지에서의 중복체크

	int insert(Member member); // 회원정보 입력
	
	Member selectFindId(Member member); // 아이디 찾기
	
	Member selectFindPw(Member member); // 비밀번호 찾기
	
	int update(Member member); // 회원정보 수정
	
	int updatePw(Member member); // 비밀번호 변경
	
	int delete(String MB_id); // 회원 탈퇴

	Member selectNum(int MB_num); // 프로필 상세보기

	int updateDriverConfirm(int MB_num); // apply 컨트롤러에서 드라이버 신청하면 컬럼 바꾸는 로직
}
