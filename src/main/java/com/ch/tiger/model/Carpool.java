package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Carpool {
	private int CP_num;
    private String CP_title;
    private Date CP_regDate;
    private String CP_startPoint;
    private String CP_endPoint;
    private Date CP_startDate;
    private Date CP_startTime;
    private int CP_fee;
    private int CP_passNum;
    private String CP_gendertype;
    private String CP_option;
    private int CP_duration;
    private String CP_comment;
    private String CP_del;
    
    //회원 테이블 회원번호 
    private int MB_num;
}
