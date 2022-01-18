package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SeatDTO {
	
	private int seatno;
	private int seatano;
	private String detail_seat;
	private String seat_status;
	
}
