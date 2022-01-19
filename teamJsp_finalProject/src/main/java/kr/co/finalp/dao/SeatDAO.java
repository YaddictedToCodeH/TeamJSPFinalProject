package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.SeatDTO;

public interface SeatDAO {
	public List<SeatDTO> selectSeat(String seat_area);
	public int selectOneSeat(SeatDTO dto);
	public void updateSeat_status(int seatno);
	
	// 총 예약된 좌석 수 구하기
	public int reservedgetTotal();
	
	// 좌석등급 별 예약된 좌석 수 구하기 
	public int reservedseatGrade(String seat_grade);
}
