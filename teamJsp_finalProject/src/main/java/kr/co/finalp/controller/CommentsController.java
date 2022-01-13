package kr.co.finalp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.CommentsDao;
import kr.co.finalp.dto.CommentsDTO;
import lombok.extern.slf4j.Slf4j;

@Controller
public class CommentsController {

	@Autowired
	CommentsDao dao;

	public void setDao(CommentsDao dao) {
		this.dao = dao;
	}
	@GetMapping("/commentsWrite")
	public String write() {
		return "commentsWriteForm";
	}
	
	@PostMapping("/commentsWrite")
	public String write(@ModelAttribute("dto")CommentsDTO dto){
		dao.InsertOne(dto);
		int fanno = dto.getFanno();
		return "redirect:/fan_boardDetail?fanno="+fanno;
	}
	
	@RequestMapping("/commentsDelete")
	public String delete(@RequestParam("commentno")int commentno,
						 @RequestParam("fanno")int fanno
			) {
		dao.deleteOne(commentno);
		return "redirect:/fan_boardDetail?fanno="+fanno; 
	}
}
