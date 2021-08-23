package com.allured.marondalgram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signin_view")
	public String signInView() {
		return "user/signin";
	}
	
	@GetMapping("/signup_view")
	public String signUpView() {
		return "user/signup";
	}
	
	@GetMapping("sign_out")
	public String logout(HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		
		hs.removeAttribute("userLoginId");
		hs.removeAttribute("userName");
		hs.removeAttribute("userNickname");
		hs.removeAttribute("userProfileUrl");
		
		return "redirect:/user/signin_view";
	}
}