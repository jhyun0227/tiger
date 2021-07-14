package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Favorite;

public interface FavoriteDao {
	List<Favorite> list(int MB_numG); // 좋아요 리스트를 불러옴

}
