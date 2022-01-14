package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.finalp.dao.ScheduleDAO;
import kr.co.finalp.dto.ScheduleDTO;

@Controller
public class TicketingController {
	
	@Autowired 
	ScheduleDAO dao;
	
	@RequestMapping("member/ticketing")
	public String ticketing(Model model) {
		List<ScheduleDTO> list1 = dao.selectHomeGames();
		List<ScheduleDTO> list2 = dao.selectAwayGames();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "ticketing";
	}
	
	
	
}
