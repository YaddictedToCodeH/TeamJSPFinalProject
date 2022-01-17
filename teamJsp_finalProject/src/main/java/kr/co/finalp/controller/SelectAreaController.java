package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.finalp.dao.SeatAreaDAO;
import kr.co.finalp.dto.SeatAreaDTO;

@Controller
public class SelectAreaController {
	
	@Autowired
	SeatAreaDAO dao;
	
	public void setDao(SeatAreaDAO dao) {
		this.dao = dao;
	}


	@RequestMapping(value = "/getArea", method = RequestMethod.GET)
	@ResponseBody
	public List<SeatAreaDTO> getArea(@RequestParam("grade")String grade) {
		List<SeatAreaDTO> list = dao.selectSeatArea(grade);
		return list;
	}
}
