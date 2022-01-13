package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.Fan_BoardDTO;
import kr.co.finalp.dto.Fan_BoardStartEnd;
import kr.co.finalp.dto.StartEnd;

@Repository
public class Fan_BoardOracleDao implements Fan_BoardDao {
	
	@Autowired
	private SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<Fan_BoardDTO> selectAll(int startNo, int endNo, String search_option, String keyword, String sort_option) {
		Fan_BoardStartEnd fbStartEnd = new Fan_BoardStartEnd(startNo, endNo, search_option, keyword, sort_option);	
		return ss.selectList("kr.co.finalp.fan_board_selectAll", fbStartEnd);
	}

	@Override
	public void InsertOne(Fan_BoardDTO dto) {
		ss.insert("kr.co.finalp.fan_board_addOne", dto);

	}

	@Override
	public Fan_BoardDTO selectOne(int fanno) {
		return ss.selectOne("kr.co.finalp.fan_board_selectOne", fanno);
	}

	@Override
	public void updateOne(Fan_BoardDTO dto) {
		ss.update("kr.co.finalp.fan_board_updateOne", dto);
		
	}

	@Override
	public void deleteOne(int fanno) {
		ss.delete("kr.co.finalp.fan_board_deleteOne", fanno);
		
	}

	@Override
	public int getTotal() {
		return ss.selectOne("kr.co.finalp.fan_board_getTotal");
	}

	@Override
	public void raiseHits(int fanno) {
		ss.update("kr.co.finalp.fan_board_raiseHits");
	}

	@Override
	public List<Fan_BoardDTO> admin_board_selectAll(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo, endNo);
		return ss.selectList("kr.co.finalp.admin_board_selectAll", se);
	}

}
