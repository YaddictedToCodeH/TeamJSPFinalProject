package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.SeatDTO;

@Repository
public class SeatOracleDAO implements SeatDAO {

	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<SeatDTO> selectSeat(String seat_area) {
		return ss.selectList("kr.co.finalp.selectSeat", seat_area);
	}


	@Override
	public int selectOneSeat(SeatDTO dto) {
		return ss.selectOne("kr.co.finalp.selectSeatno", dto);
	}

	@Override
	public void updateSeat_status(int seatno) {
		ss.update("kr.co.finalp.updateSeat_status", seatno);
	}

	@Override
	public int reservedgetTotal() {
		return ss.selectOne("kr.co.finalp.reservedSeat_total");
	}

	@Override
	public int reservedseatGrade(String seat_grade) {
		return ss.selectOne("kr.co.finalp.reservedSeat_grade",seat_grade);
	}

}
