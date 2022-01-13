package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.NoticeDTO;
import kr.co.finalp.dto.StartEnd;

@Repository
public class NoticeOracleDAO implements NoticeDao {
	
	@Autowired
	private SqlSession ss;
	
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<NoticeDTO> selectAll(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo, endNo);
		return ss.selectList("kr.co.finalp.notice_selectAll", se);
	}

	@Override
	public void InsertOne(NoticeDTO dto) {
		ss.insert("kr.co.finalp.notice_addOne", dto);
	}

	@Override
	public NoticeDTO selectOne(int noticeno) {
		return ss.selectOne("kr.co.finalp.notice_selectOne", noticeno);
	}

	@Override
	public void updateOne(NoticeDTO dto) {
		ss.update("kr.co.finalp.notice_updateOne", dto);
		
	}

	@Override
	public void deleteOne(int noticeno) {
		ss.delete("kr.co.finalp.notice_deleteOne", noticeno);
	}

	@Override
	public int getTotal() {
		return ss.selectOne("kr.co.finalp.notice_getTotal");
	}

	@Override
	public void raiseHits(int noticeno) {
		ss.update("kr.co.finalp.raiseHits", noticeno);	
	}

	@Override
	public List<NoticeDTO> mainSelect() {
		return ss.selectList("kr.co.finalp.main_notice_list");
	}
	
}
