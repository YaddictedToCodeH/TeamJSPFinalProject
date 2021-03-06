package kr.co.finalp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.GamesDAO;
import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dao.ReservationDAO;
import kr.co.finalp.dao.SeatAreaDAO;
import kr.co.finalp.dao.SeatDAO;
import kr.co.finalp.dto.MemberDTO;
import kr.co.finalp.dto.ReservationDTO;
import kr.co.finalp.dto.SeatDTO;

@Controller
public class PaymentController {
	
	@Autowired
	MemberDAO dao;
	
	@Autowired
	SeatAreaDAO sadao;
	
	@Autowired
	SeatDAO sdao;
	
	@Autowired
	GamesDAO gdao;
	
	@Autowired
	ReservationDAO rdao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	
	public void setSadao(SeatAreaDAO sadao) {
		this.sadao = sadao;
	}

	public void setSdao(SeatDAO sdao) {
		this.sdao = sdao;
	}

	public void setGdao(GamesDAO gdao) {
		this.gdao = gdao;
	}

	public void setRdao(ReservationDAO rdao) {
		this.rdao = rdao;
	}

	@RequestMapping("/member/payment")
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
			@RequestParam(value = "grade", required = false)String grade) {
		
		int resv_number = (int)((Math.random()* (999999999 - 100000000 + 1)) + 10000000);
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String id = userDetails.getUsername();
		
		MemberDTO dto = dao.selectMember(id);
		int point = dto.getMem_point();
		int raisePoint = 0;
		if(dto.getMem_grade().equals("??????")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.01);
		}else if(dto.getMem_grade().equals("?????????")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.02);
		}else if(dto.getMem_grade().equals("??????")) {
			raisePoint = (int) (Integer.parseInt(usePoint_price) * 0.04);
		}else if(dto.getMem_grade().equals("??????")) {
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
			mem_grade = "?????????";
		}else if(myAmount > 400000) {
			mem_grade = "??????";
		}else if(myAmount > 700000) {
			mem_grade = "??????";
		}else if(myAmount > 1000000) {
			mem_grade = "VIP";
		}
		if(mem_grade != "") {
			dto.setMem_grade(mem_grade);
			dao.updateGrade(dto);			
		}
		
		
		// ?????? ?????? ????????????
		// seatano ????????????
		int seatano = sadao.selectOneArea(area);
		
		// seatno ????????????
		SeatDTO sdto = new SeatDTO();
		sdto.setSeatano(seatano);
		String[] arr = detail_seat.split(", ");
		int[] seatno = new int[4];
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] != null) {
				sdto.setDetail_seat(arr[i]);
				seatno[i] = sdao.selectOneSeat(sdto);				
			}
		}
		
		// ?????? ????????? ???????????? ????????????
		int gameno = gdao.selectGameno(game_date);
		
		// ?????? ????????? ??????
		for(int i = 0; i < seatno.length; i++) {
			if(seatno[i] != 0) {
				sdao.updateSeat_status(seatno[i]);
				ReservationDTO rdto = new ReservationDTO(0, seatno[i], id, gameno, resv_number);
				rdao.insertReservation(rdto);
			}
		}
		
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
