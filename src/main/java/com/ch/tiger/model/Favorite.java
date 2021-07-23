package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Favorite {
    private int FV_num;
    private int MB_numG;
    private int MB_numT; // 받은 대상
    
    // 평점용
    private float reviewAvg;
    
    // 조인용
    private String MB_id; // 받은 대상 id
    private String MB_nickName; // 받은 대상 닉네임
    private String MB_gender; // 받은 대상 성별
    private Date MB_regDate; // 받은 대상 가입일
    
	// paging용
	private int startRow;
	private int endRow;
	
	// 검색용
	private String search;
	private String keyword;
}
