package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.Fan_BoardDTO;


public interface Fan_BoardDao {
	public List<Fan_BoardDTO> selectAll(int startNo, int endNo, String search_option, String keyword, String sort_option);
	public void InsertOne(Fan_BoardDTO dto);
	public Fan_BoardDTO selectOne(int fanno);
	public void updateOne(Fan_BoardDTO dto);
	public void deleteOne(int fanno);
	public int getTotal();
	public void raiseHits(int fanno);
	
	public List<Fan_BoardDTO> admin_board_selectAll(int startNo, int endNo);
}
