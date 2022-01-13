package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentsDTO {
	private int commentno;
	private String id;
	private int fanno;
	private String comment_date;
	private String comment_contents;
}
