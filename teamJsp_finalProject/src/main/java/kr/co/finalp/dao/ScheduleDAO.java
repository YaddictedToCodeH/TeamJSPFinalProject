package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.ScheduleDTO;
import kr.co.finalp.dto.ScheduleMonth;

public interface ScheduleDAO {
	
	public List<ScheduleDTO> selectAll(ScheduleMonth month);
	public List<ScheduleDTO> mainSelectAll();
	// 수원 kt 소닉붐 홈경기 예정 5개
	public List<ScheduleDTO> selectHomeGames();
	// 수원 kt 소닉붐 원정경기 예정 5개
	public List<ScheduleDTO> selectAwayGames();
	
	
	// admin_main
	public List<ScheduleDTO> admin_mainSelectAll();
}
