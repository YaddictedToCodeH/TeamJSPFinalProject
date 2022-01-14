package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.PlayerRankDTO;
import kr.co.finalp.dto.RankDTO;
import kr.co.finalp.dto.RankPlayerAllDTO;

@Repository
public class RankOracleDao implements RankDao{
	
	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<RankDTO> rankSelectAll() {
		return ss.selectList("kr.co.finalp.teamRank_selectAll");
	}


	@Override
	public List<PlayerRankDTO> ptsRank() {
		return ss.selectList("kr.co.finalp.ptsRank_selectAll");
	}

	@Override
	public List<PlayerRankDTO> rebRank() {
		return ss.selectList("kr.co.finalp.rebRank_selectAll");
	}

	@Override
	public List<PlayerRankDTO> astRank() {
		return ss.selectList("kr.co.finalp.astRank_selectAll");
	}



}
