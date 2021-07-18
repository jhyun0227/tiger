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

	public Member select(String mb_id) {
		return sst.selectOne("memberns.select", mb_id); // 로그인할 때 사용하는 로직
	}

	public Member selectNick(String mb_nickName) {
		return sst.selectOne("memberns.selectNick", mb_nickName); // 닉네임 중복 체크
	}

	public int insert(Member member) {
		return sst.insert("memberns.insert", member); // 회원가입
	}

	public Member selectFindId(Member member) {
		return sst.selectOne("memberns.selectFindId", member); // 아이디 찾기
	}

	public Member selectFindPw(Member member) {
		return sst.selectOne("memberns.selectFindPw", member); // 비밀번호 찾기
	}

	public int update(Member member) {
		return sst.update("memberns.update", member); // 회원정보 수정
	}
	
	public int getMbTotal(Member member) {	// 회원 총 수 구하기
		return sst.selectOne("memberns.getMbTotal", member);
	}

	public List<Member> mbList(Member member) {	// 회원 목록
		return sst.selectList("memberns.mbList", member);
	}
	
	public Member selectNum(int MB_num) {
		return sst.selectOne("memberns.selectNum", MB_num); // 프로필 상세
	}
	
	public int adminMbUpdate(Member member) {
		return sst.update("memberns.adminMbUpdate", member);
	}
	
	public int adminMbDelete(String MB_id) {
		return sst.update("memberns.adminMbDelete", MB_id);
	}
	
	public int adminMbRollback(String MB_id) {
		return sst.update("memberns.adminMbRollback", MB_id);
	}
}
