package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.ScheduleDTO;
import kr.co.finalp.dto.ScheduleMonth;

public interface ScheduleDAO {
	
	public List<ScheduleDTO> selectAll(ScheduleMonth month);
	public List<ScheduleDTO> schedulePaging(ScheduleMonth month);
	public List<ScheduleDTO> mainSelectAll();
	// 수원 kt 소닉붐 홈경기 예정 5개
	public List<ScheduleDTO> selectHomeGames();
	// 수원 kt 소닉붐 원정경기 예정 5개
	public List<ScheduleDTO> selectAwayGames();

	public ScheduleDTO selectOne(int gameno);
	
	//월별 갯수
	public int getTotal(ScheduleMonth month);
	// 관리자 스케줄 추가
	public void insertSchedule(ScheduleDTO dto);
	// 관리자 스케줄 수정
	public void updateSchedule(ScheduleDTO dto);
	// 관리자 스케줄 삭제
	public void deleteSchedule(int gameno);
	
	// admin_main
	public List<ScheduleDTO> admin_mainSelectAll();
}
