package kr.co.finalp.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.CommentsDao;
import kr.co.finalp.dto.CommentsDTO;
import kr.co.finalp.dto.Fan_BoardDTO;

@Controller
public class CommentsController {

	@Autowired
	CommentsDao dao;

	public void setDao(CommentsDao dao) {
		this.dao = dao;
	}
	@GetMapping(value = {"/member/commentsWrite"})
	public ModelAndView write(Principal principal, String id) {
		return new ModelAndView ("commentsWriteForm", "id", id);
	}
	
	@PostMapping(value = {"/member/commentsWrite"})
	public String write(@ModelAttribute("dto")CommentsDTO dto, Principal principal){
		
		if(principal != null) {		
			String id = principal.getName();
			CommentsDTO cdto = new CommentsDTO();
			cdto.setId(id);		
		}
		
		dao.InsertOne(dto);
		int fanno = dto.getFanno();
		return "redirect:/member/fan_boardDetail?fanno="+fanno;
	}
	
	@RequestMapping("/member/commentsDelete")
	public String delete(@RequestParam("commentno")int commentno,
						 @RequestParam("fanno")int fanno
			) {
		dao.deleteOne(commentno);
		return "redirect:/member/fan_boardDetail?fanno="+fanno; 
	}
}
