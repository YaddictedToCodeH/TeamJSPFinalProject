package kr.co.finalp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dto.MemberDTO;

@Controller
public class FindController {
	
	@Autowired
	MemberDAO dao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@GetMapping("/findId")
	public String findIdForm() {
		return "findId";
	}
	
	@GetMapping("/findPw")
	public String findPwForm() {
		return "findPw";
	}
	
	@RequestMapping(value = "/memberchk", method = RequestMethod.GET)
	@ResponseBody
	public String mailIdCheck(@RequestParam(value = "name", required = false ) String name
			,@RequestParam(value = "id", required = false) String id
			,@RequestParam("mail") String mail) {
		MemberDTO dto = new MemberDTO();
		dto.setMail(mail);
		if(id == null) {
			dto.setMem_name(name);
			String id2 = dao.findId(dto);
			if(id2 == null) {
				return "error";
			}else {
				return id2;			
			}
		}else{
			dto.setId(id);
			String pw = dao.findPw(dto);
			if(pw == null) {
				return "error";
			}else {
				return pw;
			}
		}
	}
	
	
}
