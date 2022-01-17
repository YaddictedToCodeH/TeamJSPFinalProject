package kr.co.finalp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.InquireDTO;

@Repository
public class InquireOracleDAO implements InquireDAO{
	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}


	@Override
	public List<InquireDTO> inquire_selectAll(int startNo, int endNo, String id) {
//		System.out.println("ss: " + ss);
		//StartEnd se = new StartEnd(startNo, endNo);
		HashMap map = new HashMap();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("id",id);
		
		return ss.selectList("kr.co.finalp.mypage_selectById", map);
	}


	@Override
	public void inquire_insertOne(InquireDTO dto) {
		ss.insert("kr.co.finalp.mypage_insertOne", dto);
		
	}


	@Override
	public InquireDTO inquire_selectOne(int inqno) {
		return ss.selectOne("kr.co.finalp.mypage_selectOne", inqno);
		
	}

	@Override
	public void inquire_modify(InquireDTO dto) {
		ss.update("kr.co.finalp.mypage_modify", dto);
		
	}


	@Override
	public void inquire_delete(int inqno) {
		ss.delete("kr.co.finalp.mypage_delete", inqno);
		
	}


	@Override
	public int inquire_getTotal() {
		return ss.selectOne("kr.co.finalp.mypage_getTotal");
	}


	@Override
	public void inquire_raiseHits(int inqno) {
		ss.update("kr.co.finalp.mypage_raiseHits", inqno);
		
	}


	
}
