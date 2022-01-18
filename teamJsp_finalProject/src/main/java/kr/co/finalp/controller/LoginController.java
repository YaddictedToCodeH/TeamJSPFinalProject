package kr.co.finalp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public void login(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "없는 ID이거나 ID 혹은 PW가 일치하지 않습니다.");
		}else if(logout != null) {
			model.addAttribute("logout", "logout");
		}
	}
	
	@RequestMapping("/common/cLogout")
	public String logout() {
		return "common/cLogout";
	}
	
	@RequestMapping("/member/logout")
	public String logout2(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
}
