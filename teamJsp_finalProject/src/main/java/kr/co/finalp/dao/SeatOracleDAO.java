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

}