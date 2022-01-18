package kr.co.finalp.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping(value = { "staff_c", "/member/staff_c" })
	public String staffC(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "staff_c";
	}

	@RequestMapping(value = { "staff_s", "/member/staff_s" })
	public String staffS(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "staff_s";
	}

	@RequestMapping(value = { "cheerleader", "/member/cheerleader" })
	public String cheerleader(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "cheerleader";
	}

	@RequestMapping(value = { "ticketNotice", "/member/ticketNotice" })
	public String ticketNotice(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "ticketNotice";
	}

	@RequestMapping(value = { "ticketPrice", "/member/ticketPrice" })
	public String ticketPrice(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "ticketPrice";
	}

	@RequestMapping(value = { "ci", "/member/ci" })
	public String ci(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "ci";
	}

	@RequestMapping(value = { "store", "/member/store" })
	public String store(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "store";
	}

	@RequestMapping(value = { "introduce", "/member/introduce" })
	public String introduce(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "introduce";
	}

	@RequestMapping(value = { "map", "/member/map" })
	public String map(Principal principal, Model model) {
		if (principal != null) {
			String id = principal.getName();
			model.addAttribute("id", id);
		}
		return "map";
	}

}
