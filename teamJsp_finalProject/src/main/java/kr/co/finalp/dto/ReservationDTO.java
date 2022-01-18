package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationDTO {
	private int resvno;
	private int seatno;
	private String id;
	private int gameno;
	private int resv_number;
}
