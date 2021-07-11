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
	@RequestMapping("noticeList")
	public String noticeList(Model model, Notice notice, HttpSession session, String pageNum) {
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
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String MB_id = (String)session.getAttribute("MB_id");
		model.addAttribute("MB_id", MB_id);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("num", num);
		return "notice/noticeList";
	}
	@RequestMapping("noticeWriteForm")
	public String noticeWriteForm(int num, String pageNum, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "notice/noticeWriteForm";
	}
	@RequestMapping("noticeWrite")
	public String noticeWrite(int num, Notice notice, String pageNum, Model model, HttpSession session) {
		int number = ns.getMaxNum();	// 공지사항 번호 생성 용도
//		Member member = null;	// 임시 추가
//		Member memberDB = mbs.select(member.getMB_id());	// 임시 추가
		int MB_num = (int)session.getAttribute("MB_num");	// null값 들어감 --여기서부터 작업
		notice.setMB_num(MB_num);
		notice.setNT_num(number);
		int result = ns.noticeWrite(notice);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "notice/noticeWrite";
	}
}
