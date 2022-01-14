package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.PlayerDTO;
import kr.co.finalp.dto.PlayerRecordDTO;

@Repository
public class PlayerOracleDAO implements PlayerDAO{

	@Autowired
	private SqlSession ss;
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<PlayerDTO> selectAll() {
		return ss.selectList("kr.co.finalp.player_selectAll");
	}

	@Override
	public List<PlayerDTO> selectPos(String player_pos) {
		return ss.selectList("kr.co.finalp.player_selectPos", player_pos);
	}

	@Override
	public PlayerDTO selectOne(int player_backno) {
		return ss.selectOne("kr.co.finalp.player_selectOne", player_backno);
	}

	@Override
	public PlayerRecordDTO selectSumRecord(int player_backno) {
		return ss.selectOne("kr.co.finalp.player_selectSumRecord", player_backno);
	}

	@Override
	public PlayerRecordDTO selectAvgRecord(int player_backno) {
		return ss.selectOne("kr.co.finalp.player_selectAvgRecord", player_backno);
	}

	@Override
	public PlayerRecordDTO selectTopRecord(int player_backno) {
		return ss.selectOne("kr.co.finalp.player_selectTopRecord", player_backno);
	}

	@Override
	public void updateOne(PlayerDTO dto) {
		ss.update("kr.co.finalp.player_updateOne", dto);	
	}

	@Override
	public void InsertOne(PlayerDTO dto) {
		ss.insert("kr.co.finalp.player_insertOne", dto);
	}

	@Override
	public void deleteOne(int player_code) {
		ss.delete("kr.co.finalp.player_deleteOne",player_code);
		
	}



}
