package kr.co.finalp.controller;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.finalp.dao.RecordDAO;
import kr.co.finalp.dto.PlayerRecordDTO;
import kr.co.finalp.dto.TeamRecordDTO;

@Controller
public class RecordController{
	
	@Autowired
	RecordDAO dao;

	public void setDao(RecordDAO dao) {
		this.dao = dao;
	}
	
	List<TeamRecordDTO> teamRecordlist;
	ArrayList<String> team_name = new ArrayList<String>();
	
	@RequestMapping("/recordingroom")
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
		
		return "recordingroom";
	}
	
	@RequestMapping("/recordingroom2")
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
	
		List<PlayerRecordDTO> playerRecordlist2 = dao.selectSort(base);
		ArrayList<Integer> player_code = new ArrayList<Integer>();
		
		
		model.addAttribute("teamRecordlist", teamRecordlist);
		model.addAttribute("team_name", team_name);
		model.addAttribute("playerRecordlist", playerRecordlist);
		model.addAttribute("player_name" ,player_name);
		
		return "recordingroom";
	}
	
	
}
