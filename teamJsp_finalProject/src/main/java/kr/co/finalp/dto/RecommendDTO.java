package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecommendDTO {

	private int recomno;
	private String id;
	private int galleryno;
	private int likeCheck;
	
	private int fanno; 
		
}
