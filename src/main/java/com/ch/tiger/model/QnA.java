package com.ch.tiger.model;
import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class QnA {
	private int QA_num;
    private String QA_title;
    private Date QA_regDate;
    private String QA_content;
    private String QA_fileName;
    private int QA_ref;
    private int QA_refStep;
    private int QA_refLevel;
    private String QA_del;
    private int MB_num;
    //paging용
    private int startRow;
    private int endRow;
    //검색용
    private String search;
    private String keyword;
    //upload용 사진
    private MultipartFile file;
    //조인용
    private String MB_id;
    private String MB_nickname;
    
}
