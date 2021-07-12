package com.ch.tiger.model;

import lombok.Data;

@Data
public class Review {
    private int RV_num;			//후기등록번호
    private int RV_star;		//별점
    private String RV_content;	//후기내용
    
    private Carpool carpool;
    private int CP_num;			//매칭게시글번호
    
    private Member member;
    private String MB_id;		//회원아이디
}
