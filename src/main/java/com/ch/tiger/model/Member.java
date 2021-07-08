package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private int MB_num;
	private String MB_id;
	private String MB_pw;
	private String MB_name;
	private String MB_regNum;
	private String MB_nickName;
    private String MB_tel;
	private String MB_gender;
    private Date MB_regDate;
	private String MB_car;
	private String MB_driverConfirm;
	private String MB_del;
    private String MB_img;
}
