package kr.co.finalp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GamesOracleDAO implements GamesDAO{
	
	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	@Override
	public int selectGameno(String game_date) {
		return ss.selectOne("kr.co.finalp.selectOneGameno", game_date);
	}

}
