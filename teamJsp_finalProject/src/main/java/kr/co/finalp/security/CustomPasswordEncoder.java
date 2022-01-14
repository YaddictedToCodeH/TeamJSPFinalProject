package kr.co.finalp.security;

import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomPasswordEncoder implements PasswordEncoder{

	@Override
	public String encode(CharSequence rawPassword) {
		System.out.println("패스워드 : " + rawPassword);
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// 입력된 패스워드와 인코딩 패스워드가 동일한지 여부를 리턴
		System.out.println(rawPassword.toString().equals(encodedPassword));
		return rawPassword.toString().equals(encodedPassword);
	}
	
}
