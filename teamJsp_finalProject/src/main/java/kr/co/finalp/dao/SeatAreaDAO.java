package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.SeatAreaDTO;

public interface SeatAreaDAO {
	public List<SeatAreaDTO> selectSeatArea(String seat_grade);
}
