package kr.co.finalp.dao;


import java.util.HashMap;
import java.util.List;

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

	@Override
	public MemberDTO mypage_id(String id) {
		return ss.selectOne("kr.co.finalp.imformation_id",id);
	}

	@Override
	public void modify(MemberDTO dto) {
		ss.update("kr.co.finalp.modifyMember", dto);
	}

	@Override
	public int getPoint(String id) {
		return ss.selectOne("kr.co.finalp.getPoint",id);
	}

	@Override
	public MemberDTO selectMember(String id) {
		return ss.selectOne("kr.co.finalp.selectMember", id);
	}

	@Override
	public void updatePoint(MemberDTO dto) {
		ss.update("kr.co.finalp.member_updatePoint", dto);
	}

	@Override
	public void updateAmount(MemberDTO dto) {
		ss.update("kr.co.finalp.member_updateAmount", dto);
	}

	@Override
	public void updateGrade(MemberDTO dto) {
		ss.update("kr.co.finalp.member_updateGrade", dto);
	}
	
	
	
}
