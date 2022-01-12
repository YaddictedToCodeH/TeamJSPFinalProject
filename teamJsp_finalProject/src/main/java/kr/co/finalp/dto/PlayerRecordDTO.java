package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlayerRecordDTO {
	int player_recordno;
	int player_code;
	int player_pts;
	int player_min;
	int player_fg;
	int player_three;
	int player_ft;
	int player_reb;
	int player_ast;
	int player_stl;
	int player_bs;
	int player_to;
	int gameno;

}
