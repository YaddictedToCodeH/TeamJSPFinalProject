package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.ScheduleDTO;
import kr.co.finalp.dto.ScheduleMonth;

@Repository
public class ScheduleOracleDao {
	
	@Autowired
	private SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}


	public List<ScheduleDTO> selectAll(ScheduleMonth month) {
		return ss.selectList("kr.co.finalp.schedule_selectAll", month);
	}
	
	public List<ScheduleDTO> mainSelectAll() {
		return ss.selectList("kr.co.finalp.main_schedule_list");
	}

}
