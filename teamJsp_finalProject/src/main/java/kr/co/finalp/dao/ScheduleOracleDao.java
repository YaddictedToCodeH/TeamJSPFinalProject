package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.ScheduleDTO;
import kr.co.finalp.dto.ScheduleMonth;

@Repository
public class ScheduleOracleDao implements ScheduleDAO{
	
	@Autowired
	private SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<ScheduleDTO> selectAll(ScheduleMonth month) {
		return ss.selectList("kr.co.finalp.schedule_selectAll", month);
	}
	
	@Override
	public List<ScheduleDTO> mainSelectAll() {
		return ss.selectList("kr.co.finalp.main_schedule_list");
	}

	@Override
	public List<ScheduleDTO> selectHomeGames() {
		return ss.selectList("kr.co.finalp.selectHomeGames");
	}

	@Override
	public List<ScheduleDTO> selectAwayGames() {
		return ss.selectList("kr.co.finalp.selectAwayGames");
	}

	@Override
	public int getTotal(ScheduleMonth month) {
		return ss.selectOne("kr.co.finalp.schedule_getTotl",month);
	}

	@Override
	public List<ScheduleDTO> schedulePaging(ScheduleMonth month) {
		return  ss.selectList("kr.co.finalp.schedule_paging", month);
	}

	@Override
	public void insertSchedule(ScheduleDTO dto) {
		ss.insert("kr.co.finalp.admin_schedule_insert", dto);
	}

	@Override
	public void updateSchedule(ScheduleDTO dto) {
		ss.update("kr.co.finalp.admin_schedule_update", dto);
	}

	@Override
	public void deleteSchedule(int gameno) {
		ss.delete("kr.co.finalp.admin_schedule_delete", gameno);
	}

	@Override
	public ScheduleDTO selectOne(int gameno) {
		return ss.selectOne("kr.co.finalp.scheduleSelectOne", gameno);
	}
	
	@Override
	public List<ScheduleDTO> admin_mainSelectAll() {
		return ss.selectList("kr.co.finalp.admin_main_schedule_list");
	}
	
	

}
