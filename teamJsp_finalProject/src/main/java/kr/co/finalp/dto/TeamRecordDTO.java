package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamRecordDTO {
	
	int team_recordno;
	int teamno;
	int winteam;
	int loseteam;
	int team_pts;
	int team_reb;
	int team_ast;
	int team_stl;
	int team_bs;
	int team_to;
	int gameno;

}
