package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.Admin_InquireDAO;
import kr.co.finalp.dao.ScheduleDAO;
import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.ScheduleDTO;

@Controller
public class Admin_MainController {
	
	@Autowired
	ScheduleDAO scheduleDao;
	
	@Autowired
	Admin_InquireDAO inquireDao;
	
	@RequestMapping("/admin_main")
	public ModelAndView admin_main(Model model) {
		
		List<ScheduleDTO> scheduleList = scheduleDao.admin_mainSelectAll();
		model.addAttribute("schedule", scheduleList);
		
		List<InquireDTO> inquireList = inquireDao.admin_inquire_selectAll();
		model.addAttribute("inquire",inquireList);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_main");
		
		return mav;	
	}
	
	@RequestMapping("admin_banner")
	public String admin_banner() {
		return "admin_banner";
	}
	
}
