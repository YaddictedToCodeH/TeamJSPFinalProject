package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScheduleMonth {
	private int select_month;
	private int startNo;
	private int endNo;
	private int gameno;
}
