package com.ch.tiger.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.tiger.model.Member;
import com.ch.tiger.model.Message;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.MessageService;
import com.ch.tiger.service.PagingBean;

@Controller
public class MessageController {
	@Autowired
	private MessageService mgs;
	@Autowired
	private MemberService mbs;
	
//	쪽지보내는 임시 페이지
	@RequestMapping("imsi")
	public String imsi(Member member, String pageNum, Model model, HttpSession session) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = mbs.getMbTotal(member);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> mbList = mbs.mbList(member);	// 회원 목록
		int num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"아이디", "이름", "닉네임", "성별", "가입일"};
		model.addAttribute("title", title);
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("mbList", mbList);
		model.addAttribute("num", num);	//목록 번호 생성 위한 num
		return "msg/imsi";
	}
	
//	쪽지보내기 
	@RequestMapping("msgWriteForm")
	public String msgWriteForm(int MB_num, Model model) {
		Member member = mbs.selectNum(MB_num);
		String nickname = member.getMB_nickName();
		model.addAttribute("nickname", nickname);
		model.addAttribute("member", member);
		return "nolayout/msgWriteForm";
	}
	
	@RequestMapping("msgWriteResult")
	public String msgWriteResult(Member member, Message msg, Model model, HttpSession session) {
		int result = 0;
		String MB_id = (String)session.getAttribute("MB_id");
		Member member1 = mbs.select(MB_id);
		int MB_numS = member1.getMB_num();
		msg.setMB_numS(MB_numS);
		result = mgs.insert(msg);
		System.out.println("result:"+result);
		model.addAttribute("result", result);
		return "nolayout/msgWriteResult";
	}
	
	@RequestMapping("msgRecieveList")
	public String msgRecieveList(Message msg, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		msg.setMB_numR(MB_num);
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 2;
		int total = mgs.getTotal(msg);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		msg.setStartRow(startRow);
		msg.setEndRow(endRow);
		List<Message> list = mgs.recieveList(msg);
		for (Message msg1 : list) {
			Member member1 = mbs.selectNum(msg1.getMB_numS());
			msg1.setNicknameS(member1.getMB_nickName());
		}
		int num = total - startRow+1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);		
		return "msg/msgRecieveList";
	}
	
	@RequestMapping("msgSendList")
	public String msgSendList(Message msg, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		msg.setMB_numS(MB_num);
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 2;
		int total = mgs.getSendTotal(msg);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		msg.setStartRow(startRow);
		msg.setEndRow(endRow);
		List<Message> list = mgs.sendList(msg);
		for (Message msg1 : list) {
			Member member1 = mbs.selectNum(msg1.getMB_numS());
			msg1.setNicknameR(member1.getMB_nickName());
		}
		int num = total - startRow+1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);		
		return "msg/msgSendList";
	}
	
	@RequestMapping("msgDelete")
	public String msgDelete(HttpServletRequest request) {
		String[] msgs = request.getParameterValues("valueArr");
		int size = msgs.length;
		System.out.println("size:"+size);
		for(int i = 0;i<size;i++) {
			int MSG_num=Integer.parseInt(msgs[i]);
			mgs.delete(MSG_num);
		}
		return "msg/msgRecieveList";
	}
	
	@RequestMapping("msgView")
	public String msgView(int MSG_num, String pageNum, Model model) {
		Message message = mgs.select(MSG_num);
		model.addAttribute("message", message);
		model.addAttribute("pageNum", pageNum);
		return "msg/msgView";
	}
}
