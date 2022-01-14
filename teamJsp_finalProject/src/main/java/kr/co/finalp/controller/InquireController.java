package kr.co.finalp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.service.InquireService;
import kr.co.finalp.dto.InquireDTO;
import kr.co.finalp.dto.PageUtil;

@Controller
@RequestMapping("/inquire")
public class InquireController {
	@Autowired
	InquireService service;
	
	
	public void setService(InquireService service) {
		this.service = service;
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(Model model,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage
			) {
		int totalNumber = service.getTotal();
		int countPerPage = 30;
		
		Map<String, Object> map = PageUtil.getPageDate(totalNumber, countPerPage, currentPage);
		
		model.addAttribute("map", map);
		
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		
		return new ModelAndView("mypage", "list", service.readAll(startNo, endNo));
	}
	
	@GetMapping("/write")
	public String writeForm() {
		return "writeForm";
	}
	
	@PostMapping("/write")
	public String insert(@ModelAttribute("dto") InquireDTO dto,
						 HttpServletRequest req) {
		service.write(dto);
		return "redirect:/inquire/list";
	}
	
	@GetMapping("/detail")
	public ModelAndView detailForm(@RequestParam("inqno") int inqno) {
		InquireDTO dto = service.readOne(inqno);
		return new ModelAndView("detail", "dto", dto);
	}
	
	
}
