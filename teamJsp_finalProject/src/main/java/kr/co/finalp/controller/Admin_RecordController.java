package kr.co.finalp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.RecordDAO;
import kr.co.finalp.dto.PlayerDTO;
import kr.co.finalp.dto.PlayerRecordDTO;
import kr.co.finalp.dto.TeamRecordDTO;

@Controller
public class Admin_RecordController {

	@Autowired
	RecordDAO dao;
	
	

	public void setDao(RecordDAO dao) {
		this.dao = dao;
	}
	
	List<TeamRecordDTO> teamRecordlist;
	ArrayList<String> team_name = new ArrayList<String>();
	
	@RequestMapping("/admin_recordingroom")
	public String recordingroom(Model model) {
		
		teamRecordlist = dao.selectAll();
		List<PlayerRecordDTO> playerRecordlist = dao.selectSort("player_pts");
		ArrayList<String> player_name = new ArrayList<String>();
	
		
		for(TeamRecordDTO dto : teamRecordlist) {
			team_name.add(dao.selectTeamName(dto.getTeamno()));
		}
		for(PlayerRecordDTO dto : playerRecordlist) {
			player_name.add(dao.selectPlayerName(dto.getPlayer_code()));
		}
		
		model.addAttribute("teamRecordlist", teamRecordlist);
		model.addAttribute("team_name", team_name);
		model.addAttribute("playerRecordlist", playerRecordlist);
		model.addAttribute("player_name" ,player_name);
		
		return "admin_recordingroom";
	}
	
	@RequestMapping("/admin_recordingroom2")
	public String recordingroom2(Model model, @RequestParam(value="base", required = false)String base) {
		
		if(base.equals("득점")) base = "player_pts";
		else if(base.equals("평균 출전시간")) base = "player_min";
		else if(base.equals("필드골")) base = "player_fg";
		else if(base.equals("3점슛")) base = "player_three";
		else if(base.equals("자유투"))base = "player_ft";
		else if(base.equals("리바운드")) base = "player_reb";
		else if(base.equals("어시스트")) base = "player_ast";
		else if(base.equals("스틸")) base = "player_stl";
		else if(base.equals("블록")) base = "player_bs";
		else if(base.equals("턴오버")) base = "player_to";

		List<PlayerRecordDTO> playerRecordlist = dao.selectSort(base);
		ArrayList<String> player_name = new ArrayList<String>();
		
		for(PlayerRecordDTO dto : playerRecordlist) {
			player_name.add(dao.selectPlayerName(dto.getPlayer_code()));
		}
		


		
		
		model.addAttribute("teamRecordlist", teamRecordlist);
		model.addAttribute("team_name", team_name);
		model.addAttribute("playerRecordlist", playerRecordlist);
		model.addAttribute("player_name" ,player_name);
		
		return "admin_recordingroom";
	}
	
	@GetMapping("/admin_recordingroomModify")
	public String update(@RequestParam("player_code")int player_code, Model model) {
		List<PlayerRecordDTO> prcd = dao.selectList(player_code);
		model.addAttribute("prcd", prcd);
		
		return "/admin_recordingroomModifyForm";
	}

}
