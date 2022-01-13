package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.NoticeDTO;

public interface NoticeDao {
	public List<NoticeDTO> selectAll(int startNo, int endNo);
	public void InsertOne(NoticeDTO dto);
	public NoticeDTO selectOne(int noticeno);
	public void updateOne(NoticeDTO dto);
	public void deleteOne(int noticeno);
	public int getTotal();
	public void raiseHits(int noticeno);
	
	public List<NoticeDTO> mainSelect();

	
}
