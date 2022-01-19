package kr.co.finalp.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.finalp.dao.InquireDAO;
import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dao.ReservationDAO;
import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.MemberDTO;
import kr.co.finalp.dto.ReservationDTO;

@Service
@Repository
public class InquireServiceImple implements InquireService{

	@Autowired
	InquireDAO inqire_dao;
	
	@Autowired
	MemberDAO member_dao;
	
	@Autowired
	ReservationDAO reservation_dao;
	
	
	public void setDao(InquireDAO dao) {
		this.inqire_dao = dao;
	}
	
	@Override
	public List<InquireDTO> mypage_readAll(int startNo, int endNo, String id) {
		System.out.println(" id : " + id );
		return inqire_dao.inquire_selectAll(startNo, endNo, id);
	}

	@Override
	public void mypage_write(InquireDTO dto) {
		inqire_dao.inquire_insertOne(dto);
		
	}

	@Override
	public InquireDTO mypage_readOne(int inqno) {
	
		InquireDTO dto = inqire_dao.inquire_selectOne(inqno);
		return dto;
	}

	@Override
	public int mypage_getTotal() {
		return inqire_dao.inquire_getTotal();
	}

	@Override
	public MemberDTO mypage_impormation(String id) {
		MemberDTO dto = member_dao.mypage_id(id);
		return dto;
	}

	@Override
	public void mypage_modifyOne(MemberDTO dto) {
		member_dao.modify(dto);
	}

	@Override
	public List<ReservationDTO> mypage_ticket(String id) {
		List<ReservationDTO> list = reservation_dao.mypage_ticket(id);
		return list;
	}




















	

}
