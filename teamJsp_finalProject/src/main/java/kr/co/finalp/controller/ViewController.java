package kr.co.finalp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping("staff_c")
	public String staffC() {
		return "staff_c";
	}
	
	@RequestMapping("staff_s")
	public String staffS() {
		return "staff_s";
	}
	
	@RequestMapping("cheerleader")
	public String cheerleader() {
		return "cheerleader";
	}
	
	@RequestMapping("ticketNotice")
	public String ticketNotice() {
		return "ticketNotice";
	}
	@RequestMapping("ticketPrice")
	public String ticketPrice() {
		return "ticketPrice";
	}
	@RequestMapping("ci")
	public String ci() {
		return "ci";
	}
	@RequestMapping("store")
	public String store() {
		return "store";
	}
	@RequestMapping("introduce")
	public String introduce() {
		return "introduce";
	}
	@RequestMapping("map")
	public String map() {
		return "map";
	}
	
}
