package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GalleryStartEnd {
	private int galleryCategoryNo;
	private int startNo;
	private int endNo;
	
	private String sort_order;
}
