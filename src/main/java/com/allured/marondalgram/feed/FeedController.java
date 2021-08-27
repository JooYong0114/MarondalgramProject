package com.allured.marondalgram.feed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.allured.marondalgram.feed.bo.FeedBO;
import com.allured.marondalgram.feed.model.Comment;
import com.allured.marondalgram.feed.model.Feed;
import com.allured.marondalgram.feed.model.Like;

@Controller
@RequestMapping("/feed")
public class FeedController {
	@Autowired
	private FeedBO feedBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		List<Feed> feedList = feedBO.getFeedList();
		model.addAttribute("feedList", feedList);
		
		List<Comment> commentList = feedBO.getCommentList();
		model.addAttribute("commentList", commentList);
		
		List<Like> likeList = feedBO.getLikeList();
		model.addAttribute("likeList", likeList);
		return "feed/main";
	}
	
	@GetMapping("/profile_view")
	public String profileView() {
		return "feed/myprofile";
	}
}