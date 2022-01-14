package kr.co.finalp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.AuthoritiesDAO;
import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dto.MemberDTO;

@Controller
public class RegisterController {
	
	@Autowired
	MemberDAO dao;
	
	@Autowired
	AuthoritiesDAO dao2;
	
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
	
	@PostMapping("/registerOk")
	public String registerOk(
			@RequestParam("id")String id,
			@RequestParam("pw")String pwd,
			@RequestParam("name")String mem_name,
			@RequestParam("birth")String mem_birth,
			@RequestParam("genderNum")String gender,
			@RequestParam("phone1")String phone1,
			@RequestParam("phone2")String phone2,
			@RequestParam("phone3")String phone3,
			@RequestParam("mailId")String mailId,
			@RequestParam("mailAddress")String mailAddress,
			@RequestParam(value = "mailOk", required = false)String mailOk,
			@RequestParam("addr1")String addrs,
			@RequestParam("addr2")String detail_addrs) {
		
		if(Integer.parseInt(gender) % 2 == 1) gender = "M";
		else gender = "F";
		
		if(mailOk == null) mailOk = "0";
		else mailOk = "1";
		
		String mp = phone1 + phone2 + phone3;
		String mail = mailId + "@" + mailAddress;
		
		MemberDTO dto = new MemberDTO(id, pwd, mem_name, mem_birth, gender, mp, mail, mailOk, null, 0, 0, addrs, detail_addrs, 0);
		dao.insertMember(dto);
		dao2.insertAuthority(id);
		
		return "main";
	}
	
	
}
