package com.ch.tiger.model;

import lombok.Data;

@Data
public class Review {
    private int RV_num;			// 후기등록번호
    private int RV_writer;		// 리뷰쓰는 사람 번호
    private int RV_reader;		// 리뷰 당하는 사람 번호
    private int RV_star;		// 별점
    private String RV_content;	// 후기내용
    private int RSV_num;		//예약번호
    // 조인용
    private String MB_nickName; // 리뷰 작성하는 사람의 닉네임
}
