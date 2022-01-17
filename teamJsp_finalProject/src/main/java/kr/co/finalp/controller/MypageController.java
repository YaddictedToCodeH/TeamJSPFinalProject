package kr.co.finalp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dao.PageUtil;
import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.service.InquireService;

@Controller
@RequestMapping("/member")
public class MypageController {
	
	@Autowired
	InquireService service;
	
	@Autowired
	 MemberDAO dao;
	
	public void setService(InquireService service) {
		this.service = service;
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(Model model,@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
//		@AuthenticationPrincipal User user) {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)obj;
		String id = user.getUsername();
		//System.out.println("obj : " + obj); 
		int totalNumber =service.mypage_getTotal();
		int countPerPage = 30;
		
		Map<String, Object> map = PageUtil.getPageData(totalNumber, countPerPage, currentPage);
		
		model.addAttribute("map", map);
		
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		
		return new ModelAndView("mypage", "list", service.mypage_readAll(startNo, endNo, id));
	}

	
	@GetMapping("/write")
	public String writeForm() {
		return "writeForm";
	}
	
	@PostMapping("/write")
	public String insert(@ModelAttribute("dto") InquireDTO dto,		
			HttpServletRequest req) {
		System.out.println(dto.getId());
		service.mypage_write(dto);
		return "redirect:/member/mypage";
	}
	
	@GetMapping("/detail")
	public ModelAndView detailForm(@RequestParam("inqno") int inqno) {
		InquireDTO dto = service.mypage_readOne(inqno);
		return new ModelAndView("detail", "dto", dto);
	}
	
	@GetMapping("/imformation")
	public String idForm() {
		return "imformation";
	}

	
	
}
