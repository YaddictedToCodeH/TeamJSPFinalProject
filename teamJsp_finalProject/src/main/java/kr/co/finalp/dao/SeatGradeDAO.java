package kr.co.finalp.dao;

public interface SeatGradeDAO {
	public int getPrice(String seat_grade);
	
	// 좌석등급 이름 가져오기
	public String getGrade(int seat_price);
}
