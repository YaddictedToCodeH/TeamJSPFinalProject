package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SeatGradeDTO {
	private int seatgno;
	private String seat_grade;
	private int seat_price;
}
