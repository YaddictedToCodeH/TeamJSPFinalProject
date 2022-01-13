package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.CommentsDTO;

@Repository
public class CommentsOracleDao implements CommentsDao{

	@Autowired
	private SqlSession ss;
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<CommentsDTO> selectAll(int fanno) {
		return ss.selectList("kr.co.finalp.comments_selectAll", fanno);
	}

	@Override
	public void InsertOne(CommentsDTO dto) {
		ss.insert("kr.co.finalp.comments_addOne", dto);
	}


	@Override
	public void updateOne(CommentsDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOne(int commentno) {
		ss.delete("kr.co.finalp.comments_deleteOne", commentno);
		
	}

}
