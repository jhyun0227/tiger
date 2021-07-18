package com.ch.tiger.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.QnA;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	private QnAService qas;
	@Autowired
	private MemberService mbs;
	
	@RequestMapping("qnaList")
	public String qnaList(QnA qna, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		qna.setMB_num(MB_num);
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 3;
		int total  = qas.getTotal(qna);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		List<QnA> list = qas.list(qna);
		int num = total - startRow+1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		return "qna/qnaList";
	}
	
	@RequestMapping("qnaWriteForm")
	public String qnaWriteForm(int num, String pageNum, Model model, HttpSession session) {
		int QA_ref=0, QA_refLevel=0, QA_refStep=0;
		//답변글
		if(num!=0) {
			QnA qna = qas.select(num);
			QA_ref = qna.getQA_ref();
			QA_refStep = qna.getQA_refStep();
			QA_refLevel = qna.getQA_refLevel();
		}
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("QA_ref", QA_ref);
		model.addAttribute("QA_refLevel", QA_refLevel);
		model.addAttribute("QA_refStep", QA_refStep);
		return "qna/qnaWriteForm";
	}
	
	@RequestMapping("qnaWriteResult")
	public String qnaWriteResult(QnA qna, String pageNum, Model model, HttpSession session) throws IOException {
		int result = 0;
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		qna.setMB_num(MB_num);
		int number = qas.getMaxNum();
		if(qna.getQA_num()!=0) {
			qas.updateStep(qna);
			qna.setQA_refLevel(qna.getQA_refLevel()+1);
			qna.setQA_refStep(qna.getQA_refStep()+1);
		}else qna.setQA_ref(number);
		qna.setQA_num(number);
		if (!qna.getFile().isEmpty()){
			String fileName = qna.getFile().getOriginalFilename();
			int index = fileName.lastIndexOf(".");
			String ext = fileName.substring(index);
			UUID uuid = UUID.randomUUID();
			fileName = uuid+ext;			
			qna.setQA_fileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/upload");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(qna.getFile().getBytes());
			fos.close();	
			result = qas.insertFile(qna);
		} else {
			result = qas.insert(qna);
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "qna/qnaWriteResult";
	}
	
	@RequestMapping("qnaView")
	public String qnaView(int num, String pageNum, Model model) {
		QnA qna = qas.select(num);
		model.addAttribute("qna",qna);
		model.addAttribute("pageNum", pageNum);
		return "qna/qnaView";
	}
	
	@RequestMapping("qnaDelete")
	public String delete(int num, String pageNum, Model model) {
		int result = qas.delete(num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "qna/qnaDelete";
	}
}
