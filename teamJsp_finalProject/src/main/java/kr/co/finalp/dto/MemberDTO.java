package kr.co.finalp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	
	private String id;
	private String pwd;
	private String mem_name;
	private String mem_birth;
	private String gender;
	private String mp;
	private String mail;
	private String mailOk;
	private String mem_grade;
	private int enabled;
	private int mem_point;
	private String addrs;
	private String detail_addrs;
	private int amount;
	
}
