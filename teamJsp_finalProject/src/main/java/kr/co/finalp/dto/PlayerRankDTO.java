package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlayerRankDTO {
	
	private int player_code;
	private String player_name;
	private String player_img;
	
	private float player_pts;
	private float player_reb;
	private float player_ast;
	

}
