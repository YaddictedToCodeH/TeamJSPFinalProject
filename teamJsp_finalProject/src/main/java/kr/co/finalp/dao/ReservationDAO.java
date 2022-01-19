package kr.co.finalp.dao;


import java.util.List;

import kr.co.finalp.dto.ReservationDTO;

public interface ReservationDAO {

	public void insertReservation(ReservationDTO dto);
	
	public List<ReservationDTO> mypage_ticket(String id);
}
