package com.allured.marondalgram.feed;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.allured.marondalgram.feed.bo.FeedBO;
import com.allured.marondalgram.feed.model.Feed;

@RestController
@RequestMapping("/feed")
public class FeedRestController {

	@Autowired
	private FeedBO feedBO;
	
	@PostMapping("/create_feed")
	public Map<String, String> Create(
			@RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		
		int userId = (Integer)hs.getAttribute("userId");
		String userNickname = (String)hs.getAttribute("userNickname");
		
		int count = feedBO.addFeed(userId, userNickname, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/like_statement")
	public Map<String, String> likeStatement(@RequestParam("feedId") int feedId
			, @RequestParam("userId") int userId
			, HttpServletRequest request
			, Model model) {
		Feed feed = new Feed();
		feedId = feed.getId();
		
		HttpSession hs = request.getSession();
		userId = (Integer)hs.getAttribute("userId");
		
		int insertCount = feedBO.addLike(feedId, userId);
		int likeCount = feedBO.getLikeCount(feedId, userId);
		int deleteCount = feedBO.deleteLike(feedId, userId);
		
		model.addAttribute("likeCount", likeCount);
		
		Map<String, String> result = new HashMap<>();
		
		if(insertCount == 1) {
			result.put("insertResult", "insert success");
		}
		else {
			result.put("insertResult", "insert fail");
		}
		
		if(deleteCount == 1) {
			result.put("deleteResult", "remove success");
		}
		else {
			result.put("deleteResult", "remove fail");
		}
		
		return result;
	}
}