package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Favorite {
    private int FV_num;
    private int MB_numG;
    private int MB_numT;
    
    // 평점용
    private float reviewAvg;
    
    // 조인용
    private String MB_id;
    private String MB_nickName;
    private String MB_gender;
    private Date MB_regDate;
    
	// paging용
	private int startRow;
	private int endRow;
	
	// 검색용
	private String search;
	private String keyword;
}
