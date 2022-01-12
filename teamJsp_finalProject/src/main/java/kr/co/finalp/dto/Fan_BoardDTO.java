package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//FAN_BOARD_FANNO_SEQ
//
//FANNO        NOT NULL NUMBER         
//ID           NOT NULL VARCHAR2(15)   
//FAN_TITLE    NOT NULL VARCHAR2(500)  
//FAN_DATE     NOT NULL DATE           
//FAN_CONTENTS NOT NULL VARCHAR2(1000) 
//FAN_HIT               NUMBER 

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Fan_BoardDTO {
	private int fanno;
	private String id;
	private String fan_title;
	private String fan_date;
	private String fan_contents;
	private int fan_hit;
}
