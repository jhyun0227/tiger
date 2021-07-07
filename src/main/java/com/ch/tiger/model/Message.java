package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	private int MSG_num;
    private Date MSG_regDate;
    private String MSG_content;
    private int MB_numS;
    private int MB_numR;
}
