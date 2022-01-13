package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.GalleryDao;
import kr.co.finalp.dao.NoticeDao;
import kr.co.finalp.dao.RankDao;
import kr.co.finalp.dao.ScheduleOracleDao;
import kr.co.finalp.dto.GalleryDTO;
import kr.co.finalp.dto.NoticeDTO;
import kr.co.finalp.dto.RankDTO;
import kr.co.finalp.dto.ScheduleDTO;

@Controller
public class MainController {
	
	@Autowired
	RankDao rankDao; // 팀 순위 dao
	
	@Autowired
	ScheduleOracleDao scheduleDao; // 경기일정 dao
	
	@Autowired
	NoticeDao noticeDao; // 공지사항 dao
	
	@Autowired
	GalleryDao galleryDao; // 갤러리 dao

	@RequestMapping("/main")
	public ModelAndView main(Model model) {
		
		// 팀 순위 
		List<RankDTO> rankList = rankDao.rankSelectAll();
		model.addAttribute("rank", rankList);
		
		// 경기일정
		List<ScheduleDTO> scheduleList = scheduleDao.mainSelectAll();
		model.addAttribute("schedule", scheduleList);
		
		// 공지사항
		List<NoticeDTO> noticeList = noticeDao.mainSelect();
		model.addAttribute("notice", noticeList);
		
		// 갤러리
		List<GalleryDTO> galleryList = galleryDao.mainSelect();
		model.addAttribute("gallery", galleryList);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
	}
	
}
