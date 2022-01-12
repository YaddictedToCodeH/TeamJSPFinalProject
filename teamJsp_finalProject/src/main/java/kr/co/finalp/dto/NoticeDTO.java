package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	private int noticeno;
	private int admin_no;
	private String notice_title;
	private String notice_contents;
	private String notice_date;
	private int notice_hit;
}
