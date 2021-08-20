package com.allured.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.allured.marondalgram.user.bo.UserBO;

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
}