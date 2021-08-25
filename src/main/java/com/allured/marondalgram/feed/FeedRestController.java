package com.allured.marondalgram.feed;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
}