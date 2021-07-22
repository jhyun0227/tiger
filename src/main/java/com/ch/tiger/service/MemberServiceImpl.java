package com.ch.tiger.service;
import java.util.List;

import java.util.List;

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
	public int getMbTotal(Member member) {
		return mbd.getMbTotal(member); // 관리자 회원 개수를 알기 위함
	}
	
	@Override
	public List<Member> mbList(Member member) {
		return mbd.mbList(member); // 관리자 회원 목록을 가져오기 위함
	}
	
	@Override
	public int adminMbUpdate(Member member) {
		return mbd.adminMbUpdate(member); // 관리자 회원정보 수정
	}
	
	@Override
	public int adminMbDelete(String MB_id) {
		return mbd.adminMbDelete(MB_id); // 관리자 회원 정보 삭제
	}
	
	@Override
	public int adminMbRollback(String MB_id) {
		return mbd.adminMbRollback(MB_id); // 관리자 회원 정보 복구
	}
	
	@Override
	public int adminPermit(int MB_num) {
		return mbd.adminPermit(MB_num); // 관리자 드라이버 신청 승인
	}
	
	@Override
	public int adminReject(int MB_num) {
		return mbd.adminReject(MB_num); // 관리자 드라이버 신청 거절
	}
	
	@Override
	public Member select(String MB_id) { // 회원가입 아이디 중복체크, 로그인할때 사용하는 로직
		return mbd.select(MB_id);
	}

	@Override
	public Member selectNick(String MB_nickName) { // 닉네임 중복체크
		return mbd.selectNick(MB_nickName);
	}
	
	@Override
	public Member selectNickMy(Member member) { // 마이페이지에서의 닉네임 중복체크
		return mbd.selectNickMy(member);
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
	public int updatePw(Member member) { // 비밀번호 변경
		return mbd.updatePw(member);
	}
	
	@Override
	public int delete(String MB_id) { // 회원 탈퇴
		return mbd.delete(MB_id);
	}

	@Override
	public Member selectNum(int MB_num) { // 프로필 상세
		return mbd.selectNum(MB_num);
	}

	@Override
	public int updateDriverConfirm(int MB_num) { // apply 컨트롤러에서 드라이버 신청하면 컬럼 바꾸는 로직
		return mbd.updateDriverConfirm(MB_num);
	}

}
