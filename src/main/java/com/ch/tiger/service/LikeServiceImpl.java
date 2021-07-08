package com.ch.tiger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.LikeDao;

@Service
public class LikeServiceImpl implements LikeService {
	@Autowired
	private LikeDao ld;
}
