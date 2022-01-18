package kr.co.finalp.dao;

import kr.co.finalp.dto.ReservationDTO;

public interface ReservationDAO {
	// 예매 정보 입력
	public void insertReservation(ReservationDTO dto);
}
