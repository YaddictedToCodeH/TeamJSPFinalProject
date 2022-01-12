package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.RankDao;
import kr.co.finalp.dto.PlayerRankDTO;
import kr.co.finalp.dto.RankDTO;

@Controller
public class RankController {
	
	@Autowired
	RankDao dao;

	@RequestMapping("/rank")
	public ModelAndView rank(Model model) {
		
		
		List<RankDTO> list = dao.rankSelectAll();
		List<PlayerRankDTO> list2 = dao.ptsRank();

		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rank");
		
		return mav;
	}
	
}
