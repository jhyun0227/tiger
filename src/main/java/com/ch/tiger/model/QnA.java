package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class QnA {
    private int QA_num;
    private String QA_title;
    private Date QA_regDate;
    private String QA_content;
    private int QA_ref;
    private int QA_refStep;
    private int QA_refLevel;
    private int MB_num;
}
