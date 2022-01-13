package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Fan_BoardStartEnd {
	// 시작번호 끝번호 전달용
	private int startNo;
	private int endNo;
	private String search_option;
	private String keyword;
	private String sort_option;
}
