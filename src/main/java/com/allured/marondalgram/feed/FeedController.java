package com.allured.marondalgram.feed;

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

@Controller
@RequestMapping("/feed")
public class FeedController {
	@Autowired
	private FeedBO feedBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model
			, HttpServletRequest request) {
		HttpSession hs = request.getSession();
		int userId = (Integer)hs.getAttribute("userId");
		
		List<FeedWithCommentAndLike> feedList = feedBO.getFeedList(userId);
		model.addAttribute("feedList", feedList);
		
		return "feed/main";
	}
}