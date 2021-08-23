package com.allured.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.allured.marondalgram.user.bo.UserBO;
import com.allured.marondalgram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signupUser(
			@RequestParam("loginId") String loginId
			, @RequestParam("name") String name
			, @RequestParam("nickname") String nickname
			, @RequestParam("email") String email
			, @RequestParam("password") String password) {
		
		Map<String, String> result = new HashMap<>();
		int count = userBO.addUser(loginId, name, nickname, email, password);
		
		if(count == 1) {
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/id_duplicate_check")
	public Map<String, Boolean> idDuplicateCheck(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		if(userBO.idDuplicateCheck(loginId) == false) {
			result.put("result", false);
		}
		else {
			result.put("result", true);
		}
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> login(@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		
		Map<String, String> result = new HashMap<>();
		
		User user = userBO.login(loginId, password);

		if(user != null) {
			HttpSession hs = request.getSession();
			
			hs.setAttribute("userLoginId", user.getLoginId());
			hs.setAttribute("userName", user.getName());
			hs.setAttribute("userNickname", user.getNickname());
			hs.setAttribute("userProfileUrl", user.getProfileUrl());
			
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		
		return result;
	}
}