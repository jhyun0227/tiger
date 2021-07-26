package com.ch.tiger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.tiger.model.Favorite;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired
	private SqlSessionTemplate sst;

	// 좋아요 리스트를 불러옴
	@Override
	public List<Favorite> list(Favorite favorite) {
		return sst.selectList("favoritens.list", favorite);
	}

	// 프로필에서 좋아요 표시를 하기위해 두 계정의 번호를 담아서 조회
	@Override
	public Favorite select(Favorite favorite) {
		return sst.selectOne("favoritens.select", favorite);
	}

	// 좋아요 추가
	@Override
	public int addFv(Favorite favorite) {
		return sst.insert("favoritens.addFv", favorite);
	}

	// 좋아요 삭제
	@Override
	public int deleteFv(Favorite favorite) {
		return sst.delete("favoritens.deleteFv", favorite);
	}

	// 좋아요 목록 개수
	@Override
	public int getTotal(Favorite favorite) {
		return sst.selectOne("favoritens.getTotal", favorite);
	}
}
