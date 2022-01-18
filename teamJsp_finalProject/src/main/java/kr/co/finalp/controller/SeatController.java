package kr.co.finalp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.finalp.dao.SeatDAO;
import kr.co.finalp.dto.SeatDTO;

@Controller
public class SeatController {
	@Autowired
	SeatDAO dao;
	
	public void setDao(SeatDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/getSeat", method = RequestMethod.GET)
	@ResponseBody
	public List<SeatDTO> getSeat(@RequestParam("seat_area")String seat_area) {
		System.out.println(seat_area);
		List<SeatDTO> list = dao.selectSeat(seat_area);
		return list;
	}
}
