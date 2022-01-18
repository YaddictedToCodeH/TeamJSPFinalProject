package kr.co.finalp.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.ScheduleDAO;
import kr.co.finalp.dto.ScheduleDTO;

@Controller
public class TicketingController {
	
	@Autowired 
	ScheduleDAO dao;
	
	@RequestMapping("member/ticketing")
	public String ticketing(Model model,Principal principal) {
		List<ScheduleDTO> list1 = dao.selectHomeGames();
		List<ScheduleDTO> list2 = dao.selectAwayGames();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		
		return "ticketing";
	}
	
	@RequestMapping("member/selectArea")
	public String selectArea(Model model, @RequestParam("game_date")String game_date, Principal principal,
			@RequestParam("game_arena")String game_arena,
			@RequestParam("team_name")String team_name,
			@RequestParam("team_name2")String team_name2,
			@RequestParam("team_logo")String team_logo,
			@RequestParam("team_logo2")String team_logo2) {
		
		ScheduleDTO dto = new ScheduleDTO();
		dto.setGame_date(game_date);
		dto.setGame_arena(game_arena);
		dto.setTeam_name(team_name);
		dto.setTeam_name2(team_name2);
		dto.setTeam_logo(team_logo);
		dto.setTeam_logo2(team_logo2);
		
		model.addAttribute("dto",dto);
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
			
		return "selectArea";
	}
	
}
