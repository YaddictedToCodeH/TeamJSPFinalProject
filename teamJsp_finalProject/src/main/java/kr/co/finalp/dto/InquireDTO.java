package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquireDTO {
    int inqno;
	String id;
	String inq_title;
	String inq_date;
	String inq_contents;
	int inq_status;
	String inq_ans;
}
