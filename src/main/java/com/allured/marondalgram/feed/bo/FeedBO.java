package com.allured.marondalgram.feed.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.allured.marondalgram.common.FileManager;
import com.allured.marondalgram.feed.dao.FeedDAO;
import com.allured.marondalgram.feed.model.Comment;
import com.allured.marondalgram.feed.model.Feed;
import com.allured.marondalgram.feed.model.Like;

@Service
public class FeedBO {

	@Autowired
	private FeedDAO feedDAO;
	
	public int addFeed(int userId, String userNickname, String content, MultipartFile file) {
		FileManager fileManager = new FileManager();
		String filePath = fileManager.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
		return feedDAO.insertFeed(userId, userNickname, content, filePath);
	}
	
	public int deleteFeed(int id) {
		return feedDAO.deleteFeed(id);
	}
	
	public List<Feed> getFeedList() {
		return feedDAO.selectFeedList();
	}
	
	public int addLike(int feedId, int userId) {
		return feedDAO.insertLike(feedId, userId);
	}
	
	public List<Like> getLikeList() {
		return feedDAO.selectLikeList();
	}
	
	public int deleteLike(int feedId, int userId) {
		return feedDAO.deleteLike(feedId, userId);
	}
	
	public int deleteLikeIfDeleteFeed(int feedId) {
		return feedDAO.deleteLikeIfDeleteFeed(feedId);
	}
	
	public int addComment(int userId, String userNickname, int feedId, String comment) {
		return feedDAO.insertComment(userId, userNickname, feedId, comment);
	}
	
	public List<Comment> getCommentList() {
		return feedDAO.selectCommentList();
	}
	
	public int deleteCommentIfDeleteFeed(int feedId) {
		return feedDAO.deleteCommentIfDeleteFeed(feedId);
	}
}