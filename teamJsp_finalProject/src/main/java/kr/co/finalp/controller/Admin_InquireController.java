package kr.co.finalp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.Admin_InquireDAO;
import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.PageUtil;

@Controller
@RequestMapping
public class Admin_InquireController {
	@Autowired
	Admin_InquireDAO dao;
	
	
	
	public void setDao(Admin_InquireDAO dao) {
		this.dao = dao;
	}


	
	@RequestMapping("/admin/admin_inquire")
	public ModelAndView mypage(Model model,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage
			) {
		int totalNumber = dao.admin_inquire_getTotal();
		int countPerPage = 4;
		
		Map<String, Object> map = PageUtil.getPageDate(totalNumber, countPerPage, currentPage);
		
		model.addAttribute("map", map);
		
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		
		return new ModelAndView("admin_inquire", "list", dao.admin_inquire_selectAll(startNo, endNo));
	}
	
	@GetMapping("/admin/admin_inquireReply")
	public ModelAndView admin_inquireReply(@RequestParam("inqno")int inqno) {
		InquireDTO dto = dao.admin_inquire_selectOne(inqno);
		return new ModelAndView("admin_inquireReplyForm", "dto", dto);
	}
	
	@PostMapping("/admin/admin_inquireReply")
	public String update(@ModelAttribute("dto")InquireDTO dto) {
		dao.admin_inquire_modify(dto);
		return "redirect:/admin/admin_inquire";
	}
	
	@RequestMapping("/admin/admin_inquireDelete")
	public String delete(@RequestParam("inqno")int inqno) {
		dao.admin_inquire_delete(inqno);
		return "redirect:/admin/admin_inquire";
	}
	
}
