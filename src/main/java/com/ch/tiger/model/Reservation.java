package com.ch.tiger.model;

import lombok.Data;

@Data
public class Reservation {
    private int RSV_num;
    private String RSV_confirm;
    private String RSV_mConfirm;
    private int MB_num;
    private int CP_num;
}
