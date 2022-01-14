package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GalleryDTO {
	
	private int rnum;
	private int galleryno;
	private	int gallery_category_no;
	private int admin_no;
	private String gallery_title;
	private String gallery_date;
	private int gallery_hit;
	private String gallery_category;
	private int fileno;
	private String file_url;
	
	
}
