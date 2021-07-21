package com.ch.tiger.model;

import lombok.Data;

@Data
public class Report {
    private int RP_num;
    private String RP_reason;
    private int MB_num; 	// 게시글 작성자 회원번호
    private int MB_numR;	// 신고자 회원번호
    private int CP_num;		// 신고 게시글 번호
    // paging용
    private int startRow;
    private int endRow;
	// 검색용
    private String search;
    private String keyword;
    // member용
    private String MB_id;	// 타세요 글 작성자id
    private String RP_id;	// 타세요 글 신고자id
    
}
