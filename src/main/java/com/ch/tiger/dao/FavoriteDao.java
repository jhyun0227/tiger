package com.ch.tiger.dao;

import java.util.List;

import com.ch.tiger.model.Favorite;

public interface FavoriteDao {
	List<Favorite> list(Favorite favorite); // 좋아요 리스트를 불러옴

	Favorite select(Favorite favorite); // 프로필에서 좋아요 표시를 하기위해 두 계정의 번호를 담아서 조회

	int addFv(Favorite favorite); // 좋아요 추가

	int deleteFv(Favorite favorite); // 좋아요 삭제

	int getTotal(Favorite favorite); // 페이징 위해 총 개수
}
