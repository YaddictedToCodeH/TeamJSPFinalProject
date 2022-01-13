package kr.co.finalp.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RankDTO {

	private int teamno;
	private String team_name;
	private int team_rank;
	private int win;
	private int lose;
	private float winRate;
	private int gameCount;
	
	private String team_logo;
}
