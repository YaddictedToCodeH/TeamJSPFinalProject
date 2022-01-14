package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquireDTO {
	private int inqno;
	private String id;
	private String inq_title;
	private String inq_date;
	private String inq_contents;
	private String inq_status;
	private String inq_ans;
}
