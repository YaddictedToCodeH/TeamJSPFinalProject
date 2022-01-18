package kr.co.finalp.controller;

import java.util.List;

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

import kr.co.finalp.dao.PlayerDAO;
import kr.co.finalp.dto.Fan_BoardDTO;
import kr.co.finalp.dto.PlayerDTO;
import kr.co.finalp.dto.PlayerRecordDTO;

@Controller
public class Admin_TeaminfoController {
	
	@Autowired
	PlayerDAO dao;

	public void setDao(PlayerDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/admin/admin_teaminfo")
	public ModelAndView admin_teaminfo(@RequestParam(value="player_pos",required=false)String player_pos) {
		
		List<PlayerDTO> list = null;
		
		if(player_pos == null ) {
			list = dao.selectAll();
		}else if(player_pos != null ) {
			list = dao.selectPos(player_pos);
		}
		
		return new ModelAndView("admin_teaminfo", "playerList", list);
	}
	
	@GetMapping("/admin/admin_teaminfoModify")
	public String admin_teaminfoModify(@RequestParam("player_backno")int player_backno, Model model) {
		
		PlayerDTO playerDto = dao.selectOne(player_backno);
		
		model.addAttribute("playerDto", playerDto);
	
		return "admin_teaminfoModifyForm";
		
	}
	
	@PostMapping("/admin/admin_teaminfoModify")
	public String update(@ModelAttribute("dto")PlayerDTO dto) {
		dao.updateOne(dto);
		return "redirect:/admin/admin_teaminfo";
	}
	
	@GetMapping("/admin/admin_teaminfoWrite")
	public String admin_teaminfoWrite() {
		return "admin_teaminfoWriteForm";
	}
	
	@PostMapping("/admin/admin_teaminfoWrite")
	public String insert(@ModelAttribute("dto")PlayerDTO dto) {
		dao.InsertOne(dto);
		return "redirect:/admin/admin_teaminfo";
	}
	
	@RequestMapping("/admin/admin_teaminfoDelete")
	public String delete(@RequestParam("player_code")int player_code,
			HttpServletRequest request) {
		String [] ajaxMsg = request.getParameterValues("player_code");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			dao.deleteOne(Integer.parseInt(ajaxMsg[i]));
		}
		return "redirect:/admin/admin_teaminfo";
	}
	
}
