package kr.co.finalp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.ScheduleDAO;
import kr.co.finalp.dto.Gallery_PageUtill;
import kr.co.finalp.dto.ScheduleDTO;
import kr.co.finalp.dto.ScheduleMonth;

@Controller
public class Admin_ScheduleController {

	@Autowired
	ScheduleDAO dao;
	
	public void setDao(ScheduleDAO dao) {
		this.dao = dao;
	}


	@RequestMapping(value = {"/admin/schedule"})
	public String adminSchedule(Model model, @RequestParam(name = "currentPage", defaultValue = "1")int currentPage,
								@RequestParam(name="gameno", defaultValue = "134")int gameno,
								@RequestParam(name = "select_month", defaultValue = "1")int select_month) {
	
		ScheduleMonth month = new ScheduleMonth();
		month.setGameno(gameno);
		month.setSelect_month(select_month);
		model.addAttribute("year", gameno);
		
		int totalNumber = dao.getTotal(month);
		int countPerPage = 10;
		
		Map<String, Object> map = Gallery_PageUtill.getPageData(totalNumber, countPerPage, currentPage);
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		
		map.put("select_month", select_month);
		month.setStartNo(startNo);
		month.setEndNo(endNo);
		
		List<ScheduleDTO> list = dao.schedulePaging(month);
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);
			
		return "admin_schedule";
	}
	
	// 스케줄 추가
	@GetMapping("/admin/writeSchedule")
	public String adminScheduleWriteForm() {
		return "admin_scheduleWrite";
	}
	@PostMapping("/admin/writeSchedule")
	public String adminScheduleWrite(@ModelAttribute ScheduleDTO dto) {
		dao.insertSchedule(dto);		
		return "redirect:/admin/schedule";
	}
	
	// 스케줄 수정
	@GetMapping("/admin/modifySchedule")
	public String adminSchedulemodifyForm(@RequestParam("gameno")int gameno, Model model) {
		ScheduleDTO dto = dao.selectOne(gameno);
		model.addAttribute("dto", dto);
		return "admin_scheduleModify";
	}
	@PostMapping("/admin/modifySchedule")
	public String adminSchedulemodifySchedule(@ModelAttribute ScheduleDTO dto) {
		dao.updateSchedule(dto);
		return "redirect:/admin/schedule";
	}
	
	@RequestMapping("/admin/deleteSchedule")
	public String adminScheduleDelete(HttpServletRequest req) {
		String[] gameList = req.getParameterValues("gameno");
		for(int i = 0; i < gameList.length; i++) {
			dao.deleteSchedule(Integer.parseInt(gameList[i]));
		}
		return "redirect:/admin/schedule";
	}
	
	
	
	
	
}
