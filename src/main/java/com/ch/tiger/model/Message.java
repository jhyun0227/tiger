package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Message {
	private int MSG_num;
    private Date MSG_regDate;
    private String MSG_content;
    private String MSG_delS;
    private String MSG_delR;
    private int MB_numS;
    private int MB_numR;
    //paging
    private int startRow;
    private int endRow;
    //닉네임
    private String nicknameS;
    private String nicknameR;
}
