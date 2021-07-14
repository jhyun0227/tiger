package com.ch.tiger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.tiger.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mbd;

}
