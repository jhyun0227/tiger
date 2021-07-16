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
	public Member select(String MB_id) {
		return sst.selectOne("memberns.select", MB_id); // 로그인할 때 사용하는 로직
	}

	@Override
	public Member selectNick(String MB_nickName) {
		return sst.selectOne("memberns.selectNick", MB_nickName); // 닉네임 중복 체크
	}
	
	@Override
	public Member selectNickMy(Member member) {
		return sst.selectOne("memberns.selectNickMy", member); // 마이페이지에서 닉네임 중복체크
	}


	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert", member); // 회원가입
	}

	@Override
	public Member selectFindId(Member member) {
		return sst.selectOne("memberns.selectFindId", member); // 아이디 찾기
	}

	@Override
	public Member selectFindPw(Member member) {
		return sst.selectOne("memberns.selectFindPw", member); // 비밀번호 찾기
	}

	@Override
	public int update(Member member) {
		return sst.update("memberns.update", member); // 회원정보 수정
	}
	
	@Override
	public int updatePw(Member member) {
		return sst.update("memberns.updatePw", member); // 비밀번호 변경
	}
	
	@Override
	public int delete(String MB_id) {
		return sst.update("memberns.delete", MB_id); // 회원 탈퇴
	}

	@Override
	public Member selectNum(int MB_num) {
		return sst.selectOne("memberns.selectNum", MB_num); // 프로필 상세
	}

	@Override
	public int updateDriverConfirm(int MB_num) { // apply 컨트롤러에서 드라이버 신청하면 컬럼 바꾸는 로직
		return sst.update("memberns.updateDriverConfirm", MB_num);
	}

}
