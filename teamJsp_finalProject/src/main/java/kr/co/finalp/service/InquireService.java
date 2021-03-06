package kr.co.finalp.service;

import java.util.List;


import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.MemberDTO;
import kr.co.finalp.dto.ReservationDTO;

public interface InquireService {
	public List<InquireDTO> mypage_readAll(int startNo, int endNo, String id);
	public void mypage_write(InquireDTO dto);
	public InquireDTO mypage_readOne(int inqno);
	public int mypage_getTotal();
	public MemberDTO mypage_impormation(String id);
	public List<ReservationDTO> mypage_ticket(String id);
	public void mypage_modifyOne(MemberDTO dto);

}
