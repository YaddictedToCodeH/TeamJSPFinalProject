package kr.co.finalp.dao;

import kr.co.finalp.dto.MemberDTO;

public interface MemberDAO {
	
	// id 찾기 	
	public String findId(MemberDTO dto); 
	// pw 찾기
	public String findPw(MemberDTO dto);
	// 비밀번호 변경
	public void changePw(MemberDTO dto);
	// id 중복체크
	public String idDoubleCheck(String id);
	// mail 중복체크
	public String mailDoubleCheck(String mail); 
	
}
