package com.allured.marondalgram.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.allured.marondalgram.feed.bo.FeedBO;
import com.allured.marondalgram.feed.model.FeedWithCommentAndLike;
import com.allured.marondalgram.user.bo.UserBO;
import com.allured.marondalgram.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBO userBO;

	@GetMapping("/signin_view")
	public String signInView() {
		return "user/signin";
	}
	
	@GetMapping("/signup_view")
	public String signUpView() {
		return "user/signup";
	}
	
	@GetMapping("/sign_out")
	public String logout(HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		
		hs.removeAttribute("userLoginId");
		hs.removeAttribute("userName");
		hs.removeAttribute("userNickname");
		hs.removeAttribute("userProfileUrl");
		
		return "redirect:/user/signin_view";
	}
	
	@Autowired
	private FeedBO feedBO;
	
	@GetMapping("/profile_view")
	public String profileView(@RequestParam("userNickname") String userNickname
			, @RequestParam("userId") int userId
			, Model model) {
		
		User user = userBO.getUser(userNickname);
		model.addAttribute("user", user);

		List<FeedWithCommentAndLike> feedList = feedBO.getFeedListByUserId(userId);
		model.addAttribute("feedList", feedList);
	
		return "feed/profile";
	}
}