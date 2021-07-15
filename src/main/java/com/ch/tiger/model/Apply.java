package com.ch.tiger.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Apply {
	private int AP_num;
    private String AP_picture;
    private int MB_num;
    // 사진 업로드용
    private MultipartFile fileAp;
}
