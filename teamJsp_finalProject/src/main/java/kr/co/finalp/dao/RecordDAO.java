package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.PlayerRecordDTO;
import kr.co.finalp.dto.TeamRecordDTO;

public interface RecordDAO {
	
	public List<TeamRecordDTO> selectAll();
	public String selectTeamName(int teamno);
	
	public List<PlayerRecordDTO> selectSort(String base);
	public String selectPlayerName(int player_code);

}
