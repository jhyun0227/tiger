package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Member;
public interface MemberService {
	int getMbTotal(Member member); // 관리자가 회원 수를 알기 위함
	
	List<Member> mbList(Member member); // 관리자가 회원 목록을 가져오기 위함
	
	int adminMbUpdate(Member member); // 관리자 회원 정보 수정
	
	int adminMbDelete(String MB_id); // 관리자 회원 정보 삭제
	
	int adminMbRollback(String MB_id); // 관리자 회원 정보 복구
	
	int adminPermit(int MB_num); // 관리자 드라이버 신청 승인
	
	int adminReject(int MB_num); // 관리자 드라이버 신청 거절
	
	Member select(String MB_id); // 아이디로 정보를 가져오는 로직

	Member selectNick(String MB_nickName); // 닉네임 중복 체크
	
	Member selectNickMy(Member member); // 마이페이지에서 중복 체크

	int insert(Member member); // 회원가입

	Member selectFindId(Member member); // 아이디 찾기

	Member selectFindPw(Member member); // 비밀번호 찾기

	int update(Member member); // 회원정보 수정
	
	int updatePw(Member member); // 비밀번호 변경
	
	int delete(String MB_id); // 회원 탈퇴

	Member selectNum(int MB_num); // 프로필 상세

	int updateDriverConfirm(int MB_num); // apply 컨트롤러에서 드라이버 신청하면 컬럼 바꾸는 로직
}
