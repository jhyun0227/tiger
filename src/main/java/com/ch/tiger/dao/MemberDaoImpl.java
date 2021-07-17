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
	public int getMbTotal(Member member) {	// 회원 총 수 구하기
		return sst.selectOne("memberns.getMbTotal", member);
	}
	
	@Override
	public List<Member> mbList(Member member) {	// 회원 목록
		return sst.selectList("memberns.mbList", member);
	}
	
	@Override
	public int adminMbUpdate(Member member) { // 관리자 회원정보 업데이트
		return sst.update("memberns.adminMbUpdate", member);
	}
	
	@Override
	public int adminMbDelete(String MB_id) { // 관리자 정보 삭제
		return sst.update("memberns.adminMbDelete", MB_id);
	}
	
	@Override
	public int adminMbRollback(String MB_id) { // 관리자 정보 복구
		return sst.update("memberns.adminMbRollback", MB_id);
	}
	
	@Override
	public int adminPermit(int MB_num) { // 관리자 드라이버 승인
		return sst.update("memberns.adminPermit", MB_num);
	}
	
	@Override
	public int adminReject(int MB_num) { // 관리자 드라이버 거절
		return sst.update("memberns.adminReject", MB_num);
	}
	
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
