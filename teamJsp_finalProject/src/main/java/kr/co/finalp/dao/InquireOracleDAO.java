package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.StartEnd;

@Repository
public class InquireOracleDAO implements InquireDAO{
	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}


	@Override
	public List<InquireDTO> inquire_selectAll(int startNo, int endNo) {
//		System.out.println("ss: " + ss);
		StartEnd se = new StartEnd(startNo, endNo);
		return ss.selectList("kr.co.finalp.inquire_selectAll", se);
	}


	@Override
	public void inquire_insertOne(InquireDTO dto) {
		ss.insert("kr.co.jhta.fianlp.inquire_insertOne", dto);
		
	}


	@Override
	public InquireDTO inquire_selectOne(int inqno) {
		return ss.selectOne("kr.co.finalp.inquire_selectOne", inqno);
		
	}


	@Override
	public void inquire_modify(InquireDTO dto) {
		ss.update("kr.co.finalp.inquire_modify", dto);
		
	}


	@Override
	public void inquire_delete(int inqno) {
		ss.delete("kr.co.finalp.inquire_delete", inqno);
		
	}


	@Override
	public int inquire_getTotal() {
		return ss.selectOne("kr.co.finalp.inquire_getTotal");
	}


	@Override
	public void inquire_raiseHits(int inqno) {
		ss.update("kr.co.jhta.fianlp.inquire_raiseHits", inqno);
		
	}


	@Override
	public List<InquireDTO> admin_inquire_selectAll() {
		return ss.selectList("kr.co.finalp.admin_main_inquire_list");
	}
	
}
