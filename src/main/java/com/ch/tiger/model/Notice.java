package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
    private int NT_num;
    private String NT_title;
    private Date NT_regDate;
    private String NT_content;
    private String NT_del;
    private int MB_num;
    // paging용
    private int startRow;
    private int endRow;
    // 검색용
    private String search;
    private String keyword;
}
