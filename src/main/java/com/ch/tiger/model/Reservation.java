package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Reservation {
    private int RSV_num;			//예약번호	
    private String RSV_confirm;		//예약여부
    private String RSV_mConfirm;	//매칭여부
    private int MB_num;				//회원 번호
    private int CP_num;				//매칭개시글번호
    
    // 조인용 (드라이버 예약내역에서 사용)
    private String MB_nickName; 	// 별명
    private String MB_gender;		// 성별
    
    // 조인용(탑승자 예약내역에서 사용)
    private Date CP_startDate; 	// 출발일
    private String CP_startPoint;	// 출발지
    private String CP_endPoint;		// 도착지
    
    private int MB_numDv;		// 드라이버 번호(게시글 작성자)
    private String MB_nickNameDv; 	// 드라이버 닉네임
    
	// paging용
	private int startRow;
	private int endRow;
	
	// 검색용
	private String search;
	private String keyword;
}
