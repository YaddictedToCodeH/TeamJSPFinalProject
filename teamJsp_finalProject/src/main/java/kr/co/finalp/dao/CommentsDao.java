package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.CommentsDTO;
import kr.co.finalp.dto.Fan_BoardDTO;

public interface CommentsDao {
	public List<CommentsDTO>selectAll(int fanno);
	public void InsertOne(CommentsDTO dto);
	public void updateOne(CommentsDTO dto);
	public void deleteOne(int commentno);
	public int getTotal();
	
	public List<CommentsDTO> admin_board_commentSelectAll(int startNo, int endNo);
}
