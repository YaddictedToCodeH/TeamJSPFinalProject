package kr.co.finalp.dao;


import kr.co.finalp.dto.ReservationDTO;

public interface ReservationDAO {

	public void insertReservation(ReservationDTO dto);
	
	public ReservationDTO mypage_ticket(String id);
}
