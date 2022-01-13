package kr.co.finalp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.MemberDTO;

@Repository
public class MemberOracleDAO implements MemberDAO{
	
	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public String findId(MemberDTO dto) {
		return ss.selectOne("kr.co.finalp.findId", dto);
	}

	@Override
	public String findPw(MemberDTO dto) {
		return ss.selectOne("kr.co.finalp.findPw", dto);
	}

	@Override
	public void changePw(MemberDTO dto) {
		ss.update("kr.co.finalp.changePw", dto);
	}

	@Override
	public String idDoubleCheck(String id) {
		return ss.selectOne("kr.co.finalp.idDoubleCheck", id);
	}

	@Override
	public String mailDoubleCheck(String mail) {
		return ss.selectOne("kr.co.finalp.mailDoubleCheck", mail);
	}

	@Override
	public void insertMember(MemberDTO dto) {
		ss.insert("kr.co.finalp.insertMember", dto);
	}
	
	
	
}
