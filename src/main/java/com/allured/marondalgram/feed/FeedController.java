package com.allured.marondalgram.feed;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/feed")
public class FeedController {
	
	@GetMapping("/main_view")
	public String mainView() {
		return "feed/main";
	}
}