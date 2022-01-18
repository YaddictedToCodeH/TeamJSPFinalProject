package kr.co.finalp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dto.MemberDTO;

@Controller
public class PaymentController {
	
	@Autowired
	MemberDAO dao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("/payment")
	public String payment(Model model,Authentication authentication,
			@RequestParam(value = "usePoint_price", required = false)String usePoint_price,
			@RequestParam(value = "detail_seat", required = false)String detail_seat,
			@RequestParam(value = "area", required = false)String area,
			@RequestParam(value = "game_date", required = false)String game_date,
			@RequestParam(value = "game_arena", required = false)String game_arena,
			@RequestParam(value = "team_name", required = false)String team_name,
			@RequestParam(value = "team_name2", required = false)String team_name2,
			@RequestParam(value = "team_logo", required = false)String team_logo,
			@RequestParam(value = "team_logo2", required = false)String team_logo2,
			@RequestParam(value = "usePoint", required = false)String usePoint,
			@RequestParam(value = "grade", required = false)String grade,
			@RequestParam(value = "pg_token", required = false)String pg_token) {
		
		System.out.println(pg_token);
		System.out.println(usePoint_price);
		System.out.println(detail_seat);
		System.out.println(area);
		System.out.println(game_date);
		System.out.println(game_arena);
		System.out.println(team_name);
		System.out.println(team_name2);
		System.out.println(team_logo);
		System.out.println(team_logo2);
		System.out.println(usePoint);
		int resv_number = (int)((Math.random()* (999999999 - 100000000 + 1)) + 10000000);
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String id = userDetails.getUsername();
		
		MemberDTO dto = dao.selectMember(id);
		int point = dto.getMem_point();
		int raisePoint = 0;
		if(dto.getMem_grade().equals("일반")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.01);
		}else if(dto.getMem_grade().equals("패밀리")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.02);
		}else if(dto.getMem_grade().equals("실버")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.04);
		}else if(dto.getMem_grade().equals("골드")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.06);
		}else if(dto.getMem_grade().equals("VIP")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.08);
		}
		
		point = point - Integer.parseInt(usePoint) + raisePoint;
		dto.setMem_point(point);
		dao.updatePoint(dto);
		int myAmount = dto.getAmount() + Integer.parseInt(usePoint_price);
		dto.setAmount(myAmount);
		dao.updateAmount(dto);
		String mem_grade = "";
		if(myAmount > 200000) {
			mem_grade = "패밀리";
		}else if(myAmount > 400000) {
			mem_grade = "실버";
		}else if(myAmount > 700000) {
			mem_grade = "골드";
		}else if(myAmount > 1000000) {
			mem_grade = "VIP";
		}
		if(mem_grade != "") {
			dto.setMem_grade(mem_grade);
			dao.updateGrade(dto);			
		}
		
		
		// 예매 테이블 코드
		
		
		model.addAttribute("mp", dto.getMp());
		model.addAttribute("game_date", game_date);
		model.addAttribute("game_arena", game_arena);
		model.addAttribute("grade", grade);
		model.addAttribute("area", area);
		model.addAttribute("detail_seat", detail_seat);
		model.addAttribute("resv_number", resv_number);
		model.addAttribute("team_name", team_name);
		model.addAttribute("team_name2", team_name2);
		model.addAttribute("team_logo", team_logo);
		model.addAttribute("team_logo2", team_logo2);
		
		
		return "payment";
	}
}
