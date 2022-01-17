package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.SeatDTO;

public interface SeatDAO {
	public List<SeatDTO> selectSeat(String seat_area);
}
