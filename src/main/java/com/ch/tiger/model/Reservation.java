package com.ch.tiger.model;

import lombok.Data;

@Data
public class Reservation {
    private int RSV_num;			//예약번호	
    private String RSV_confirm;		//예약여부
    private String RSV_mConfirm;	//매칭여부
    private int MB_num;				//회원 번호
    private int CP_num;				//매칭개시글번호
    
    // 타세요 상세보기에서 사용, paging용
 	private int startRow;
 	private int endRow;
 	
 	//join용
}
