package com.allured.marondalgram.feed.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.allured.marondalgram.common.FileManager;
import com.allured.marondalgram.feed.comment.bo.CommentBO;
import com.allured.marondalgram.feed.comment.model.Comment;
import com.allured.marondalgram.feed.dao.FeedDAO;
import com.allured.marondalgram.feed.like.bo.LikeBO;
import com.allured.marondalgram.feed.like.model.Like;
import com.allured.marondalgram.feed.model.Feed;
import com.allured.marondalgram.feed.model.FeedWithCommentAndLike;

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
	
	public List<FeedWithCommentAndLike> getFeedList() {
		List<Feed> feedList = feedDAO.selectFeedList();
		
		List<FeedWithCommentAndLike> feedWithCommentAndLikeList = new ArrayList<>();
		
		for(Feed feed : feedList) {
			List<Comment> commentList = commentBO.getCommentList(feed.getId());	
			List<Like> likeList = likeBO.getLikeList(feed.getId());
			
			FeedWithCommentAndLike feedWithCommentAndLike = new FeedWithCommentAndLike();
			
			feedWithCommentAndLike.setFeed(feed);
			feedWithCommentAndLike.setCommentList(commentList);
			feedWithCommentAndLike.setLikeList(likeList);
			
			feedWithCommentAndLikeList.add(feedWithCommentAndLike);
		}
		
		return feedWithCommentAndLikeList;
	}
	
	@Autowired
	private CommentBO commentBO;
	
	public int addComment(int userId, String userNickname, int feedId, String comment) {
		return commentBO.addComment(userId, userNickname, feedId, comment);
	}
	
	public int deleteCommentIfDeleteFeed(int feedId) {
		return commentBO.deleteCommentIfDeleteFeed(feedId);
	}
	
	@Autowired
	private LikeBO likeBO;
	
	public int addLike(int feedId, int userId) {
		return likeBO.addLike(feedId, userId);
	}
	
	public int deleteLike(int feedId, int userId) {
		return likeBO.deleteLike(feedId, userId);
	}
	
	public int deleteLikeIfDeleteFeed(int feedId) {
		return likeBO.deleteLikeIfDeleteFeed(feedId);
	}
}