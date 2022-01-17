package kr.co.finalp.dao;


import kr.co.finalp.dto.RecommendDTO;

public interface RecommendDAO {
	
	public int insertLike(RecommendDTO dto);
	public int updateLike(RecommendDTO dto);
	public int insertLikeFan(RecommendDTO dto);
	public int updateLikeFan(RecommendDTO dto);
	public int deleteLike(int recom);
	
	public RecommendDTO selectRecomOne(RecommendDTO dto); // 갤러리 추천 등록 여부 체크	
	public RecommendDTO selectFanRecomOne(RecommendDTO dto); // 팬게시판 추천 등록 여부 체크	
}
