package com.ch.tiger.model;

import lombok.Data;

@Data
public class Review {
    private int RV_num;			//후기등록번호
    private String RV_writer;
    private String RV_reader;
    private int RV_star;		//별점
    private String RV_content;	//후기내용
    private int RSV_num;			//예약번호
}
