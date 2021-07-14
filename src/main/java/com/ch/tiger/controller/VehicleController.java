package com.ch.tiger.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ch.tiger.model.Member;
import com.ch.tiger.model.Vehicle;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.VehicleService;

@Controller
public class VehicleController {
	@Autowired
	private VehicleService vs;
	@Autowired
	private MemberService mbs;
	
	// 차량 관리 리스트로 이동
	@RequestMapping("vehicleList")
	public String vehicleList(HttpSession session, Model model) {
		int result = 0;
		String MB_id = (String) session.getAttribute("MB_id"); // 세션값을 가져옴
		Member member = mbs.select(MB_id); // 세션값을 가져와서 객체에 대입
		int MB_num = member.getMB_num(); // vehicle fk가 mb_num으로 되있기 때문에 값을 또 넣어줌
		if (member.getMB_driverConfirm() == "Y" || member.getMB_driverConfirm().equals("Y")) { // 드라이버 신청여부가 y일 경우에 볼수 있게
			result = 1; // y인경우 1을 리턴함
			// 리스트를 가져오는 로직
			List<Vehicle> vcList = vs.list(MB_num);
			model.addAttribute("vcList", vcList);
		} else {
			result = -1;
		}
		model.addAttribute("MB_num", MB_num);
		model.addAttribute("result", result);
		return "mypage/vehicleList";
	}
	
	// 차량 등록 폼
	@RequestMapping("vehicleInsertForm")
	public String vehicleInsertForm(HttpSession session, Model model) {
		String MB_id = (String) session.getAttribute("MB_id"); // 세션값을 가져옴
		Member member = mbs.select(MB_id); // 세션값을 가져와서 객체에 대입
		int MB_num = member.getMB_num();
		model.addAttribute("MB_num", MB_num);
		return "mypage/vehicleInsertForm";
	}
	
	// 차량 등록
	@RequestMapping("vehicleInsertResult")
	public String vehicleInsertResult(Vehicle vehicle, Model model, HttpSession session) throws IOException {
		// 회원정보 등록
		int result = 0;
		String VH_carNum = vehicle.getVH_carNum();
		Vehicle vehicle2 = vs.select(VH_carNum); // 차량번호로 중복 값이 있는지 확인
		if (vehicle2 == null) {
			// 사진을 리소스 폴더에 저장하기 위한 로직
			String fileName1 = vehicle.getFile().getOriginalFilename();
			UUID uuid = UUID.randomUUID(); // 파일이름이 겹치지 않게 하기 위함
			String fileName = uuid+"_"+fileName1;
			// 파일을 리소스 폴더에 저장
			String real = session.getServletContext().getRealPath("/resources/vehicleImg");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(vehicle.getFile().getBytes());
			fos.close();
			
			// 정보를 등록
			vehicle.setVH_carPicture(fileName);
			result = vs.insert(vehicle);
			
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "mypage/vehicleInsertResult";
	}
	
	// 차량 상세보기
	@RequestMapping("vehicleView")
	public String vehicleView(int VH_num, Model model) {
		Vehicle vehicle = vs.select(VH_num);
		model.addAttribute("vehicle", vehicle);
		return "mypage/vehicleView";
	}
	
	// 등록 차량 삭제
	@RequestMapping("vehicleDelete")
	public String vehicleDelete(int VH_num, Model model) { 
		int result = vs.delete(VH_num);
		model.addAttribute("result", result);
		return "mypage/vehicleDelete";
	}
}
