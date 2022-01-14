package kr.co.finalp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.RecommendDTO;

@Repository
public class RecommendOracleDao implements RecommendDAO {

	@Autowired
	SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public int insertLike(RecommendDTO dto) {
		return ss.insert("kr.co.finalp.insert_like", dto);

	}

	@Override
	public int updateLike(RecommendDTO dto) {
		return ss.update("kr.co.finalp.update_like", dto);
	}

	// 추천 등록 여부 체크
	@Override
	public RecommendDTO selectRecomOne(RecommendDTO dto) {
		return ss.selectOne("kr.co.finalp.selectRecomOne", dto);
	}

	@Override
	public int deleteLike(int recom) {
		return ss.delete("kr.co.finalp.delete_like", recom);

	}

	

}
