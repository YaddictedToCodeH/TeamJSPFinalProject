package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.CommentsDTO;

public interface CommentsDao {
	public List<CommentsDTO>selectAll(int fanno);
	public void InsertOne(CommentsDTO dto);
	public void updateOne(CommentsDTO dto);
	public void deleteOne(int commentno);
}
