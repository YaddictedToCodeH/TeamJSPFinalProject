package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.RecommendDTO;

public interface RecommendDAO {
	
	public int insertLike(RecommendDTO dto);
	public int updateLike(RecommendDTO dto);
	public int deleteLike(int recom);
	
	public RecommendDTO selectRecomOne(RecommendDTO dto); // 추천 등록 여부 체크	publ
}
