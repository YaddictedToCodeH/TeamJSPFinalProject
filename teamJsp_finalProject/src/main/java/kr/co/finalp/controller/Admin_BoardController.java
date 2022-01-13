package kr.co.finalp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.CommentsDao;
import kr.co.finalp.dao.Fan_BoardDao;
import kr.co.finalp.dto.CommentsDTO;
import kr.co.finalp.dto.CommentsPageUtil;
import kr.co.finalp.dto.Fan_BoardDTO;
import kr.co.finalp.dto.Fan_BoardPageUtil;


@Controller
public class Admin_BoardController {
	
	
	@Autowired
	Fan_BoardDao fan_boardDao;
	
	@Autowired
	CommentsDao commentDao;
	

	@RequestMapping("/admin_board")
	public ModelAndView admin_board(Model model,
			@RequestParam(name="currentPage", defaultValue ="1" ) int currentPage,
			@RequestParam(name="currentPage2", defaultValue ="1" ) int currentPage2
			) {
		int totalNumber = fan_boardDao.getTotal();
			
		int countPerPage = 4;
		
		Map<String, Object> map = Fan_BoardPageUtil.getPageData(totalNumber, countPerPage, currentPage);
		
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");
		List<Fan_BoardDTO> list = fan_boardDao.admin_board_selectAll(startNo, endNo);
		
		int totalNumber2 = commentDao.getTotal();
		int countPerPage2 = 4;
		
		Map<String, Object> map2 = CommentsPageUtil.getPageData(totalNumber2, countPerPage2, currentPage2);
		
		int startNo2 = (int) map2.get("startNo");
		int endNo2 = (int) map2.get("endNo");
		List<CommentsDTO> list2 = commentDao.admin_board_commentSelectAll(startNo2, endNo2);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("map2", map2);
		model.addAttribute("list2", list2);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_board");
		
		return mav;
	}
	

	// 게시물 선택 삭제 
	@RequestMapping("/admin_boardDelete")
	String delete(@RequestParam("fanno")int fanno,
			HttpServletRequest request) {
		String [] ajaxMsg = request.getParameterValues("fanno");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			fan_boardDao.deleteOne(Integer.parseInt(ajaxMsg[i]));			
		}
		return "redirect:/admin_board";
	}
	
	
}
