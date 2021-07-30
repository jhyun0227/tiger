package com.ch.tiger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Reservation> selectList(Reservation reservation) {
		return sst.selectList("reservationns.selectList", reservation); // 드라이버 예약 내역에서 리뷰 작성을 위해 본인의 글을 이용한 사람을 찾아내기 위함
	}

	@Override
	public Reservation selectCp(int RSV_num) {
		return sst.selectOne("reservationns.selectCp", RSV_num); // 리뷰 작성 이후 다시 드라이버 예약내역 리스트를 불러오기 위해
	}

	@Override
	public int getTotalMyRv(Reservation reservation) {
		return sst.selectOne("reservationns.getTotalMyRv", reservation); // 탑승자 예약내역에서 내가 신청한 글 개수를 불러오기
	}

	@Override
	public List<Reservation> myRvList(Reservation reservation) {
		return sst.selectList("reservationns.myRvList", reservation); // 탑승자 예약내역에서 내가 신청한 글 리스트를 불러오기
	}

	public int insert(Reservation reservation) {
		return sst.insert("reservationns.insert", reservation);
	}

	@Override
	public List<Reservation> reservationList(Reservation reservation) {
		return sst.selectList("reservationns.reservationList", reservation);
	}

	@Override
	public int getTotal(int CP_num) {
		return sst.selectOne("reservationns.getTotal", CP_num);
	}

	@Override
	public int updateAccept(Reservation reservation) {
		return sst.update("reservationns.updateAccept", reservation);
	}

	@Override
	public int updateDenial(Reservation reservation) {
		return sst.update("reservationns.updateDenial", reservation);
	}

	@Override
	public List<Reservation> adminRvList(Reservation reservation) {	// 관리자가 CP_num에 해당하는 카풀글 내 예약내역 - 동윤
		return sst.selectList("reservationns.adminRvList", reservation);
	}

	@Override
	public int getTotalRv(Reservation reservation) {
		return sst.selectOne("reservationns.getTotalRv", reservation); // 추가 0723
	}

	@Override
	public List<Reservation> adminRvAllList(Reservation reservation) {
		return sst.selectList("reservationns.adminRvAllList", reservation); // 추가 0723
	}

	@Override
	public Reservation selectRv(Reservation reservation) { // 타세요 신청 중복 방지
		return sst.selectOne("reservationns.selectRv", reservation);
	}

	@Override
	public int updateAllDeny(int CP_num) { // 게시글 매칭완료시 기존에 신청된 수락버튼 거절로 변환
		return sst.update("reservationns.updateAllDeny", CP_num);
	}

	@Override
	public int delete(Reservation reservation) { // 매칭대기상태인 탑승자가 신청취소버튼 클릭시
		return sst.delete("reservationns.delete", reservation);
	}

}
