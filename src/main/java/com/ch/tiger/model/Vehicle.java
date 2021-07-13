package com.ch.tiger.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Vehicle {
    private int VH_num;
    private String VH_carNum;
    private String VH_carName;
    private int VH_carYear;
    private String VH_km;
    private String VH_carType;
    private String VH_insu;
    private String VH_carPicture;
    private String VH_del;
    private int MB_num;
    // 업로드
    private MultipartFile file;
}
