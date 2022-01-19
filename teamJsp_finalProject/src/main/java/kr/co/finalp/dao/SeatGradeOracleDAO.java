package kr.co.finalp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SeatGradeOracleDAO implements SeatGradeDAO {

	@Autowired
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public int getPrice(String seat_grade) {
		return ss.selectOne("kr.co.finalp.getPrice",seat_grade);
	}

	@Override
	public String getGrade(int seat_price) {
		return ss.selectOne("kr.co.finalp.getGrade",seat_price);
	}

}
