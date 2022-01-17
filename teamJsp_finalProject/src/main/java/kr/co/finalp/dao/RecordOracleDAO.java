package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.PlayerRecordDTO;
import kr.co.finalp.dto.TeamRecordDTO;

@Repository
public class RecordOracleDAO implements RecordDAO {

	@Autowired
	private SqlSession ss;
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<TeamRecordDTO> selectAll() {
		return ss.selectList("kr.co.finalp.teamRecord_selectAll");
	}

	@Override
	public String selectTeamName(int teamno) {
		return ss.selectOne("kr.co.finalp.teamRecord_selectTeamName", teamno);
	}
	
	@Override
	public List<PlayerRecordDTO> selectSort(String base) {
		return ss.selectList("kr.co.finalp.playerRecord_selectAll", base);
	}

	@Override
	public String selectPlayerName(int player_code) {
		return ss.selectOne("kr.co.finalp.teamRecord_selectPlayerName", player_code);
	}

	@Override
	public List<PlayerRecordDTO> selectList(int player_code) {
		return ss.selectList("kr.co.finalp.playerRecord_selectOne",player_code);
	}

	@Override
	public void updateOne(PlayerRecordDTO dto) {
		ss.update("kr.co.finalp.playerRecord_updateOne", dto);		
	}

	@Override
	public List<TeamRecordDTO> selectList2(int teamno) {
		return ss.selectList("kr.co.finalp.teamRecord_selectOne",teamno);
	}

	@Override
	public void updateTeam(TeamRecordDTO dto) {
		ss.update("kr.co.finalp.teamRecord_updateOne", dto);
		
	}



}
