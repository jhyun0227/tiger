package com.ch.tiger.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Apply;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Vehicle;
import com.ch.tiger.service.ApplyService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.VehicleService;

@Controller
public class ApplyController {
	@Autowired
	private ApplyService as;
	@Autowired
	private MemberService mbs;
	@Autowired
	private VehicleService vs;

	// 드라이버 신청으로 이동
	@RequestMapping("driverApplyForm")
	public String driverApplyForm(Model model, HttpSession session) {
		int result = 0;
		
		// 멤버 객체에서 apply 테이블을 검색하기 위해 mb_num값을 가져온다.
		String MB_id = (String)session.getAttribute("MB_id");
		Member member = mbs.select(MB_id);
		int MB_num = member.getMB_num();
		
		Apply apply = as.select(MB_num);
		// 신청 기록이 없거나 driverConfirm 값이 N이면 result=1 값을 가짐
		if (apply == null || member.getMB_driverConfirm().equals("N") || member.getMB_driverConfirm() == "N") {
			result = 1;
			model.addAttribute("member", member);
		} else {
			if (member.getMB_driverConfirm() == "Y" || member.getMB_driverConfirm().equals("Y")) {
				result = 0; // 드라이버 등록이 완료된 계정일 경우
			} else if (member.getMB_driverConfirm() == "I" || member.getMB_driverConfirm().equals("I")) {
				result = -1; // 신청중인 계정일 경우
			}
		}
		model.addAttribute("result", result);
		return "apply/driverApplyForm";
	}
	
	// 드라이버 신청, 차량 등록
	@RequestMapping("driverApplyResult")
	public String driverApplyResult(Apply apply, Vehicle vehicle, Model model, HttpSession session) throws IOException {
		int resultAp = 0; // 드라이버 신청
		int resultVh = 0; // 차량등록
		int resultMb = 0; // 멤버 드라이버 신청 컬럼 변경
		
		// 드라이버 신청 저장
		// 사진을 리소스 폴더에 저장하기 위한 로직
		String fileName1 = apply.getFileAp().getOriginalFilename();
		UUID uuid = UUID.randomUUID(); // 파일이름이 겹치지 않게 하기 위함
		String fileName = uuid+"_"+fileName1;
		// 파일을 리소스 폴더에 저장
		String real = session.getServletContext().getRealPath("/resources/applyImg");
		FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
		fos.write(vehicle.getFile().getBytes());
		fos.close();
		
		// 변경된 파일이름을 apply 객체에 저장하고 db로 보냄
		apply.setAP_picture(fileName);
		resultAp = as.insert(apply);
		
		// 만약 드라이버 신청이 성공적으로 되었다면 차량 정보를 저장함
		if (resultAp == 1) {
			String VH_carNum = vehicle.getVH_carNum();
			Vehicle vehicle2 = vs.select(VH_carNum); // 차량번호로 중복 값이 있는지 확인
			if (vehicle2 == null) {
				// 사진을 리소스 폴더에 저장하기 위한 로직
				String fileName2 = vehicle.getFile().getOriginalFilename();
				UUID uuidVh = UUID.randomUUID(); // 파일이름이 겹치지 않게 하기 위함
				String fileNameVh = uuidVh+"_"+fileName2;
				// 파일을 리소스 폴더에 저장
				String realVh = session.getServletContext().getRealPath("/resources/vehicleImg");
				FileOutputStream fosVh = new FileOutputStream(new File(realVh+"/"+fileNameVh));
				fosVh.write(vehicle.getFile().getBytes());
				fosVh.close();
				
				// 정보를 등록
				vehicle.setVH_carPicture(fileNameVh);
				resultVh = vs.insert(vehicle);
				
			} else {
				resultVh = -1;
			}
		}
		
		// 둘다 입력이 성공했다면 driverConfirm 컬럼값을 'I'로 바꾼다.
		if (resultAp == 1 && resultVh == 1) {
			int MB_num = apply.getMB_num();
			resultMb = mbs.updateDriverConfirm(MB_num);
		}
		model.addAttribute("resultMb", resultMb);
		model.addAttribute("resultAp", resultAp);
		model.addAttribute("resultVh", resultVh);
		return "apply/driverApplyResult";
	}
}
