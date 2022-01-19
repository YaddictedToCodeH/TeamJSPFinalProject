package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.InquireDTO;

public interface Admin_InquireDAO {
	public List<InquireDTO> admin_inquire_selectAll(int startNo, int endNo);
	public void admin_inquire_insertOne(InquireDTO dto);
	public InquireDTO admin_inquire_selectOne(int inqno);
	public void admin_inquire_modify(InquireDTO dto);
	public void admin_inquire_delete(int inqno);
	public int admin_inquire_getTotal();
	public void admin_inquire_raiseHits(int inqno);
	public int admin_inquire_noReplyTotal();
	
	public List<InquireDTO> admin_inquire_selectAll();
}
