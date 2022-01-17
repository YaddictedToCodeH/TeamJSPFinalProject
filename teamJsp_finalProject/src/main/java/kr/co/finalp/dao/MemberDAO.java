package kr.co.finalp.dao;

import java.util.List;

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
	// 회원가입
	public void insertMember(MemberDTO dto);
	// 아이디로 포인트 가져오기
	public int getPoint(String id);
	// 회원의 모든 정보 가져오기
	public MemberDTO selectMember(String id);
}
