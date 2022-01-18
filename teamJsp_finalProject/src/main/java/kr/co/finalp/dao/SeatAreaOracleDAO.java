package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.SeatAreaDTO;

@Repository
public class SeatAreaOracleDAO implements SeatAreaDAO {

	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}


	@Override
	public List<SeatAreaDTO> selectSeatArea(String seat_grade) {
		return ss.selectList("kr.co.finalp.selectArea", seat_grade);
	}


	@Override
	public int selectOneArea(String seat_area) {
		return ss.selectOne("kr.co.finalp.selectSeatano", seat_area);
	}

}
