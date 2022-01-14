package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScheduleDTO {

	private int gameno; 
	private String game_date;
	private String game_date2;
	private String game_arena;
	private String game_status;
	private String game_result;
	private String game_score;
	
	private int teamno;
	private String team_name;
	private String team_logo;
	
	private int teamno2;
	private String team_name2;
	private String team_logo2;
	
}
