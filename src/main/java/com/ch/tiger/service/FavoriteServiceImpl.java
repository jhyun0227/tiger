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
	public List<Favorite> list(int MB_numG) {
		return fd.list(MB_numG);
	}
}
