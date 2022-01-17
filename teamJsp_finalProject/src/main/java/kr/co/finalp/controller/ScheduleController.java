package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.ScheduleOracleDao;
import kr.co.finalp.dto.RecommendDTO;
import kr.co.finalp.dto.ScheduleDTO;
import kr.co.finalp.dto.ScheduleMonth;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleOracleDao dao;
	
	public void setDao(ScheduleOracleDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = {"/schedule", "/member/schedule"})
	public ModelAndView schedule(Model model,
								 @RequestParam(name="gameno", defaultValue = "134")int gameno,
								 @RequestParam(name = "select_month", defaultValue = "1")int select_month) {			
		ScheduleMonth month = new ScheduleMonth();
		month.setGameno(gameno);
		month.setSelect_month(select_month);
		
		List<ScheduleDTO> list = dao.selectAll(month);
		
		model.addAttribute("list", list);
		model.addAttribute("month", month);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("scheduleAndResult");
		
		return mav;
	}
}
