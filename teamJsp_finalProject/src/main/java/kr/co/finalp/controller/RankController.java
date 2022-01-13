package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.RankDao;
import kr.co.finalp.dto.PlayerRankDTO;
import kr.co.finalp.dto.RankDTO;
import kr.co.finalp.dto.RankPlayerAllDTO;

@Controller
public class RankController {
	
	@Autowired
	RankDao dao;

	@RequestMapping("/rank")
	public ModelAndView rank(Model model) {
		
		
		List<RankDTO> list = dao.rankSelectAll();
		List<PlayerRankDTO> pst_list = dao.ptsRank();
		List<PlayerRankDTO> reb_list = dao.rebRank();
		List<PlayerRankDTO> ast_list = dao.astRank();

		
		model.addAttribute("list", list);
		model.addAttribute("pst_list", pst_list);
		model.addAttribute("reb_list", reb_list);
		model.addAttribute("ast_list", ast_list);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rank");
		
		return mav;
	}
	
	
	@RequestMapping("/rankPlayer")
	public ModelAndView rankPlayer(Model model,
									@RequestParam("event")String event) {
		
		List<RankPlayerAllDTO> list = dao.rankAll(event);
		
		model.addAttribute("list", list);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rank_player");
		
		return mav;
	}
	
}
