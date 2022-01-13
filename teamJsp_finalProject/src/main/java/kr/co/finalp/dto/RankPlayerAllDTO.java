package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RankPlayerAllDTO {

	private int rn;
	private String player_name;
	private int gameCount;
	
	private int sum_pts;
	private int sum_reb;
	private int sum_ast;
	
	private float avg_min;
	private float avg_pts;
	private float avg_reb;
	private float avg_ast;
	
	private String event;
}
