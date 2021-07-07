package com.ch.tiger.model;

import lombok.Data;

@Data
public class Review {
    private int RSV_num;
    private int RV_num;
    private int RV_writer;
    private int RV_reader;
    private int RV_star;
    private String RV_content;
}
