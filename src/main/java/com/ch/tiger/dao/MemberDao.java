package com.ch.tiger.dao;

import com.ch.tiger.model.Member;

public interface MemberDao {
	Member select(String mb_id); // 로그인할때 사용하는 로직

}
