package com.allured.marondalgram.feed;

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
import org.springframework.web.multipart.MultipartFile;

import com.allured.marondalgram.feed.bo.FeedBO;

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
	
	@GetMapping("/delete_feed")
	public Map<String, String> deleteFeed(@RequestParam("feedId") int feedId
			, HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		int userId = (Integer)hs.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		if(feedBO.deleteFeed(feedId, userId)) {
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/like")
	public Map<String, Boolean> likeAdd(@RequestParam("feedId") int feedId
			, HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		int userId = (Integer)hs.getAttribute("userId");
		
		boolean isLike = feedBO.like(feedId, userId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isLike) {
			result.put("result", false);
		}
		else {
			result.put("result", true);
		}
		return result;
	}
	
	@PostMapping("/comment_add")
	public Map<String, String> commentAdd(@RequestParam("userId") int userId
			, @RequestParam("userNickname") String userNickname
			, @RequestParam("feedId") int feedId
			, @RequestParam("comment") String comment) {
		int insertCount = feedBO.addComment(userId, userNickname, feedId, comment);
		
		Map<String, String> result = new HashMap<>();
		
		if(insertCount == 1) {
			result.put("insert", "success");
		}
		else {
			result.put("insert", "fail");
		}
		
		return result;
	}
}