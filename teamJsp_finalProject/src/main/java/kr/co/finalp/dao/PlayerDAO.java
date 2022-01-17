package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.PlayerDTO;
import kr.co.finalp.dto.PlayerRecordDTO;

public interface PlayerDAO {
	
	//player table
	public List<PlayerDTO> selectAll();
	public List<PlayerDTO> selectPos(String pos);
	public PlayerDTO selectOne(int player_backno);
	
	
	//playerrecord table
	public PlayerRecordDTO selectSumRecord(int player_backno);
	public PlayerRecordDTO selectAvgRecord(int player_backno);
	public PlayerRecordDTO selectTopRecord(int player_backno);
	
	//admin 
	public void updateOne(PlayerDTO dto);
	public void InsertOne(PlayerDTO dto);
	public void deleteOne(int player_code);
	public List<PlayerRecordDTO> admin_selectList(int player_code);
}
