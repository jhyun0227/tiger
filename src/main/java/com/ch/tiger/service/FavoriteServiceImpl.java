package com.ch.tiger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.FavoriteDao;
import com.ch.tiger.model.Favorite;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteDao fd;

	// 좋아요 리스트를 불러옴
	@Override
	public List<Favorite> list(Favorite favorite) {
		return fd.list(favorite);
	}

	// 프로필에서 좋아요 표시를 하기위해 두 계정의 번호를 담아서 조회
	@Override
	public Favorite select(Favorite favorite) {
		return fd.select(favorite);
	}

	// 좋아요 추가
	@Override
	public int addFv(Favorite favorite) {
		return fd.addFv(favorite);
	}
	
	// 좋아요 삭제
	@Override
	public int deleteFv(Favorite favorite) {
		return fd.deleteFv(favorite);
	}

	// 페이징 위해 총 개수
	@Override
	public int getTotal(Favorite favorite) {
		return fd.getTotal(favorite);
	}
}
