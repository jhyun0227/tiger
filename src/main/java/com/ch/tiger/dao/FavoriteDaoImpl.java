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
	public List<Favorite> list(int MB_numG) {
		return sst.selectList("favoritens.list", MB_numG);
	}
}
