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
public class TicketingCheckController {
	
	@Autowired
	MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/member/ticketingCheck")
	public String ticketingCheck(Model model, Authentication authentication, @RequestParam("grade")String grade,
			@RequestParam("area")String area,
			@RequestParam("game_date")String game_date,
			@RequestParam("game_arena")String game_arena,
			@RequestParam("team_name")String team_name,
			@RequestParam("team_name2")String team_name2,
			@RequestParam("team_logo")String team_logo,
			@RequestParam("team_logo2")String team_logo2,
			@RequestParam("usePoint_price")String usePoint_price,
			@RequestParam("usePoint")String usePoint,
			@RequestParam("detail_seat")String[] detail_seat) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		String id = userDetails.getUsername();
		MemberDTO dto = dao.selectMember(id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("grade", grade);
		model.addAttribute("area", area);
		model.addAttribute("game_date", game_date);
		model.addAttribute("game_arena", game_arena);
		model.addAttribute("team_name", team_name);
		model.addAttribute("team_name2", team_name2);
		model.addAttribute("team_logo", team_logo);
		model.addAttribute("team_logo2", team_logo2);
		model.addAttribute("usePoint_price", usePoint_price);
		model.addAttribute("usePoint", usePoint);
		model.addAttribute("detail_seat", detail_seat);
		
		return "ticketingCheck";
	}
	
}
