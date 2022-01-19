package kr.co.finalp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.Admin_InquireDAO;
import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dao.ScheduleDAO;
import kr.co.finalp.dao.SeatDAO;
import kr.co.finalp.dao.SeatGradeDAO;
import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.ScheduleDTO;

@Controller
public class Admin_MainController implements HttpSessionListener{
	
	@Autowired
	ScheduleDAO scheduleDao;
	
	@Autowired
	Admin_InquireDAO inquireDao;
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	SeatDAO seatDao;
	
	@Autowired
	SeatGradeDAO seatGradeDao;
	
	@RequestMapping("/admin_main")
	public ModelAndView admin_main(Model model) {
			
		List<ScheduleDTO> scheduleList = scheduleDao.admin_mainSelectAll();
		model.addAttribute("schedule", scheduleList);
		
		List<InquireDTO> inquireList = inquireDao.admin_inquire_selectAll();
		int noreply = inquireDao.admin_inquire_noReplyTotal();
		model.addAttribute("inquire",inquireList);
		model.addAttribute("noreply",noreply);
		
		int members = memberDao.getTotal();
		model.addAttribute("members", members);
		
		int Sideline = 25000;
		int monapark = 22000;
		int away_table = 22000;
		int second_sepcial = 20000;
		int normal = 12000;
		int Ypremium = 45000;
		
//		String seat1 = seatGradeDao.getGrade(25000);
//		String seat2 = seatGradeDao.getGrade(22000);
//		String seat3 = seatGradeDao.getGrade(20000);
//		String seat4 = seatGradeDao.getGrade(20000);
//		String seat5 = seatGradeDao.getGrade(12000);
//		String seat6 = seatGradeDao.getGrade(45000);
		
		String seat1 = "Side line";
		String seat2 = "모나파크 테이블석";
		String seat3 = "원정골대 테이블석";
		String seat4 = "2층 특석";
		String seat5 = "2층 일반석";
		String seat6 = "Y프리미엄코트석";
		
		
		int reservedseat = seatDao.reservedgetTotal();
		model.addAttribute("reservedseat", reservedseat);
		
		int price_total = seatDao.reservedseatGrade(seat1)*25000+
						  seatDao.reservedseatGrade(seat2)*22000+
						  seatDao.reservedseatGrade(seat3)*22000+
						  seatDao.reservedseatGrade(seat4)*20000+
						  seatDao.reservedseatGrade(seat5)*12000+
						  seatDao.reservedseatGrade(seat6)*45000;
		model.addAttribute("price_total", price_total);
				
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_main");
		
		
		return mav;	
	}
	
	@RequestMapping("admin_banner")
	public String admin_banner() {
		return "admin_banner";
	}
	

	
}
