package kr.co.finalp.controller;

import java.security.Principal;
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

	@RequestMapping(value = {"/rank", "/member/rank"})
	public ModelAndView rank(Model model, Principal principal) {
		
		
		List<RankDTO> list = dao.rankSelectAll();
		List<PlayerRankDTO> pst_list = dao.ptsRank();
		List<PlayerRankDTO> reb_list = dao.rebRank();
		List<PlayerRankDTO> ast_list = dao.astRank();

		
		model.addAttribute("list", list);
		model.addAttribute("pst_list", pst_list);
		model.addAttribute("reb_list", reb_list);
		model.addAttribute("ast_list", ast_list);
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rank");
		
		return mav;
	}
	
	
	
	
}
