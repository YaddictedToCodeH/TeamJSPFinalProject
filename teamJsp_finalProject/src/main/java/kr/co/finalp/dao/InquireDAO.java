package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.InquireDTO;

public interface InquireDAO {
	public List<InquireDTO> inquire_selectAll(int startNo, int endNo, String id);
	public void inquire_insertOne(InquireDTO dto);
	public InquireDTO inquire_selectOne(int inqno);
	public void inquire_modify(InquireDTO dto);
	public void inquire_delete(int inqno);
	public int inquire_getTotal();
	public void inquire_raiseHits(int inqno);
}
