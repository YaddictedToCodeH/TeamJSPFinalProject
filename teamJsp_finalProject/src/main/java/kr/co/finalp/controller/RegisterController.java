package kr.co.finalp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.MemberDAO;

@Controller
public class RegisterController {
	
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("/registerTerm")
	public String registerTerm() {
		return "registerTerm";
	}
	
	@RequestMapping("/register")
	public ModelAndView register(@RequestParam(value="check3", required = false) String check3) {
		return new ModelAndView("register", "check3", check3);
	}
	
	@RequestMapping(value = "/registerPwDoubleCheck", method = RequestMethod.GET)
	@ResponseBody
	public String registerPwDoubleCheck(@RequestParam("pw1")String pw1, @RequestParam("pw2")String pw2) {
		if(pw1.equals(pw2)) {
			return "success";
		}else {
			return "error";			
		}
	}
	
	@RequestMapping(value = "/idDoubleCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idDoubleCheck(@RequestParam("id")String id) {
		String id2 = dao.idDoubleCheck(id);
		if(id2 != null) {
			return "error";
		}else {
			return "success";
		}
	}
	
	@RequestMapping(value = "/mailDoubleCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailDoubleCheck(@RequestParam("sm_email")String mail) {
		String mail2 = dao.mailDoubleCheck(mail);
		System.out.println(mail2);
		if(mail2 != null) {
			return "error";
		}else {
			return "success";
		}
	}
	
	
	
	
}
