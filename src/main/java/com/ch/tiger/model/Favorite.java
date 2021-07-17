package com.ch.tiger.model;

import lombok.Data;

@Data
public class Favorite {
    private int FV_num;
    private int MB_numG;
    private int MB_numT;
    // 조인용
    private String MB_id;
    private String MB_nickName;
    private String MB_gender;
}
