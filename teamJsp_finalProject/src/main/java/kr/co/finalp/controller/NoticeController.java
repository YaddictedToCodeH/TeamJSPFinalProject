package kr.co.finalp.controller;

import java.security.Principal;
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

import kr.co.finalp.dao.NoticeDao;
import kr.co.finalp.dto.NoticeDTO;
import kr.co.finalp.dto.NoticePageUtil;

@Controller
//@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeDao dao;
	
	
	
	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}
	
	// notice 공지사항 페이지 
	@RequestMapping(value = {"/notice", "/member/notice"})
	public ModelAndView notice(Model model,
			@RequestParam(name="currentPage", defaultValue = "1") int currentPage, Principal principal) {
		
		int totalNumber = dao.getTotal();
		
		int countPerPage = 10;
		
		Map<String, Object> map = NoticePageUtil.getPageData(totalNumber, countPerPage, currentPage);
		
		model.addAttribute("map", map);
		
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		
		return new ModelAndView("notice","notice", dao.selectAll(startNo, endNo) );
	}
	
	// 공지사항에서 클릭시 게시물 상세사항 
	@GetMapping(value = {"/noticeDetail", "/member/noticeDetail"})
	public ModelAndView noticeDetailForm(@RequestParam("noticeno")int noticeno, Model model, Principal principal) {
		NoticeDTO dto = dao.selectOne(noticeno);
		int totalNumber = dao.getTotal();
		
		Map<String, Object> map = NoticePageUtil.getTotal(totalNumber, noticeno);
		
		model.addAttribute("map", map);
		
		// 조회수 증가
		dao.raiseHits(noticeno);
		
		if(principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		
		return new ModelAndView("noticeDetail", "dto", dto);
	}
	
	
	
	// admin 로그인시 쓰기/수정/삭제 
	
	// 쓰기 클릭시 해당 폼으로 
	@GetMapping("/notice/write")
	public String wirteForm() {
		return "noticeWriteForm";
	}
	
	// 쓰기 등록 
	@PostMapping("/notice/write")
	public String insert(@ModelAttribute("dto")NoticeDTO dto) {
		dao.InsertOne(dto);
		return "redirect:/notice";
	}
	
	// 수정하기 클릭시 해당 폼으로 
	@GetMapping("/notice/modifyForm")
	public ModelAndView modifyForm(@RequestParam("noticeno") int noticeno) {
		NoticeDTO dto = dao.selectOne(noticeno);
		return new ModelAndView("noticeModifyForm");
	}
	
	// 수정하기 등록
	@PostMapping("/notice/modify")
	public String update(@ModelAttribute("dto") NoticeDTO dto) {
		dao.updateOne(dto);
		return "redirect:/notice";
	}
	
	// 게시물 삭제
	@RequestMapping("/notice/delete")
	public String delete(@RequestParam("noticeno") int noticeno) {
		dao.deleteOne(noticeno);
		return "redirect:/notice";
	}
	
	
	
		
	
	
	
//	@GetMapping("/notice")
//	public String notice() {
//		return "notice";
//	}
	

//	@GetMapping("/")
//	public ModelAndView test(Model model) {
//		NoticeDTO dto = dao.selectOne(1);
//		return new ModelAndView("notice", "dto", dto);
//	}
}
