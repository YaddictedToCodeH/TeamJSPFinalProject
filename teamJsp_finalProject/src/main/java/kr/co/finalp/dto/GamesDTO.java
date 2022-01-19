package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GamesDTO {
	private int gameno;
	private String game_date;
	private String game_arena;
	private String game_status;
	private String game_result;
	private int teamno;
	private int teamno2;
	private String game_score;
}
