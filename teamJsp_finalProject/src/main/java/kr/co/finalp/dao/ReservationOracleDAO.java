package kr.co.finalp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.finalp.dto.ReservationDTO;

@Repository
public class ReservationOracleDAO implements ReservationDAO{


	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	@Override
	public void insertReservation(ReservationDTO dto) {
		ss.insert("kr.co.finalp.insertReservation", dto);
	}

	@Override
	public ReservationDTO mypage_ticket(String id) {
		return ss.selectOne("kr.co.finalp.mypage_ticket",id);
	}
	
}
