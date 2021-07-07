package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
    private int NT_num;
    private String NT_title;
    private Date NT_regDate;
    private String NT_content;
    private int MB_num;
}
