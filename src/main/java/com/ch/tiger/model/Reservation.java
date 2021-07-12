package com.ch.tiger.model;

import lombok.Data;

@Data
public class Reservation {
    private int RSV_num;			//예약번호	
    private String RSV_confirm;		//예약여부
    private String RSV_mConfirm;	//매칭여부
    
    private Member member;
    private String MB_applyId;		//신청회원아이디
    private String MB_writerId;		//작성회원아이디
    
    private Carpool Carpool;
    private int CP_appliedPassNum;	//신청좌석수
    private int CP_num;				//매칭개시글번호
}
