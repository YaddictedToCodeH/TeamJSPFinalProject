package kr.co.finalp.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.finalp.dao.MemberDAO;
import kr.co.finalp.dto.MemberDTO;

@Controller
public class MailCheckController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("sm_email") String sm_email) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    String from = "teamJspFinal@gmail.com";//보내는 이 메일주소
	    String to = sm_email;
	    String title = "KT 소닉붐에서 전송한 인증번호 입니다.";
	    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
	    String num = "";
	    try {
	    	MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       
	        
	        mailSender.send(mail);
	        num = Integer.toString(serti);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    return num;
	}
	
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	@ResponseBody
	public String changePw(@RequestParam("mail") String sm_email) throws Exception{
		int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    String from = "teamJspFinal@gmail.com";//보내는 이 메일주소
	    String to = sm_email;
	    String title = "임시 비밀번호가 발급되었습니다.";
	    String content = "[임시 비밀번호] "+ serti +" 입니다.";
	    String num = "";
	    MemberDTO dto = new MemberDTO();
	    dto.setMail(sm_email);
	    dto.setPwd(Integer.toString(serti));
	    dao.changePw(dto);
	    try {
	    	MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       
	        
	        mailSender.send(mail);
	        num = Integer.toString(serti);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    return num;
	}
}
