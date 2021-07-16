package com.ch.tiger.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Member;
import com.ch.tiger.model.Notice;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.NoticeService;
import com.ch.tiger.service.PagingBean;
@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	@Autowired
	private MemberService mbs;	//임시 추가
	@RequestMapping("noticeList")	// 비회원 접근 로직 구현x
	public String noticeList(Model model, Notice notice, String pageNum) {
		// 처음 notice에는 null로 받아오고, startRow, endRow 보내주기 위한 용도
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = ns.getNtTotal(notice);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		List<Notice> noticeList = ns.noticeList(notice);	// 공지사항 목록
		int num = total - startRow + 1;		// 번호 순서대로 정렬
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"제목", "내용", "제목+내용"};	// 작성자는 관리자뿐이므로 제외
		model.addAttribute("title", title);	// 검색 기능
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("noticeList", noticeList);		// 공지사항 검색 시 공지사항번호 발생
		model.addAttribute("num", num);	// 목록 번호 생성 위한 num
		return "notice/noticeList";
	}
	@RequestMapping("noticeView")
	public String noticeView(int NT_num, String pageNum, Model model) {
		Notice notice = ns.select(NT_num);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "notice/noticeView";
	}
}
