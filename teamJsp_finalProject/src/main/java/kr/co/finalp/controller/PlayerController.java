package kr.co.finalp.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.PlayerDAO;
import kr.co.finalp.dto.PlayerDTO;
import kr.co.finalp.dto.PlayerRecordDTO;

@Controller
public class PlayerController {
	
	@Autowired
	PlayerDAO dao;

	public void setDao(PlayerDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = {"/playerList" , "member/playerList"})
	public ModelAndView playerList(@RequestParam(value="player_pos",required=false)String player_pos, Principal principal, Model model) {
		
		List<PlayerDTO> list = null;
		
		if(player_pos == null ) {
			list = dao.selectAll();
		}else if(player_pos != null ) {
			list = dao.selectPos(player_pos);
		}
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		
		
		return new ModelAndView("player_list", "playerList", list);
	}
	
	@GetMapping(value = {"/playerDetail" , "member/playerDetail"})
	public String playerDetail(@RequestParam("player_backno")int player_backno, Model model, Principal principal) {
		
		PlayerDTO playerDto = dao.selectOne(player_backno);
		PlayerRecordDTO sumRecord = dao.selectSumRecord(player_backno);
		PlayerRecordDTO avgRecord = dao.selectAvgRecord(player_backno);
		PlayerRecordDTO topRecord = dao.selectTopRecord(player_backno);
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		
		model.addAttribute("playerDto", playerDto);
		model.addAttribute("sumRecordDto", sumRecord);
		model.addAttribute("avgRecordDto", avgRecord);
		model.addAttribute("topRecordDto", topRecord);
		
		
		return "player_detail";
		
	}
	
}
