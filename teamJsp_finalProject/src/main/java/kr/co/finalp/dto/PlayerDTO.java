package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlayerDTO {
	int player_code;
	int teamno;
	int player_backno;
	String player_pos;
	String player_name;
	int player_height;
	int player_weight;
	String player_school;
	String player_img;
	String player_sns;
	String player_birth;

}
