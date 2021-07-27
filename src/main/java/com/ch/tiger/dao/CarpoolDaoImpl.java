package com.ch.tiger.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Carpool;

@Repository
public class CarpoolDaoImpl implements CarpoolDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Carpool carpool) {
		return sst.insert("carpoolns.insert", carpool);
	}

	@Override
	public List<Carpool> cpList(Carpool carpool) {
		return sst.selectList("carpoolns.cpList", carpool);
	}

	@Override
	public int getTotal(Carpool carpool) {
		return sst.selectOne("carpoolns.getTotal", carpool);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("carpoolns.getMaxNum"); // 예약 내역에서 페이징을 위해 내가 올린 글을 가져오는 로직 - 준호
	}

	@Override
	public Carpool select(int CP_num) {
		return sst.selectOne("carpoolns.select", CP_num);
	}

	@Override
	public int getTotalMyRvs(Carpool carpool) {
		return sst.selectOne("carpoolns.getTotalMyRvs", carpool);
	}

	@Override
	public List<Carpool> myCarpoolList(Carpool carpool) {
		return sst.selectList("carpoolns.myCarpoolList", carpool);
	}
	
	@Override
	public int update(Carpool carpool) {
		return sst.update("carpoolns.update", carpool);
	}

	@Override
	public int delete(int CP_num) {
		return sst.update("carpoolns.delete", CP_num);
	}

	@Override
	public int adminCpDelete(int CP_num) {	// 관리자가 신고 내역에 해당하는 카풀 글 삭제 - 동윤
		return sst.update("carpoolns.adminCpDelete", CP_num);
	}

	@Override
	public int adminCpRollback(int CP_num) {	// 관리자가 신고 내역에 해당하는 카풀 글 복구 - 동윤
		return sst.update("carpoolns.adminCpRollback", CP_num);
	}

	@Override
	public List<Carpool> adminCpList(Carpool carpool) {	// 관리자 카풀 목록 - 동윤
		return sst.selectList("carpoolns.adminCpList", carpool);
	}

	public int updatePassNumNow(int CP_num) {
		return sst.update("carpoolns.updatePassNumNow", CP_num);
	}
	
}


