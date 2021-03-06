package com.allured.marondalgram.feed.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	public boolean deleteFeed(int feedId, int userId) {
		
		Feed feed = feedDAO.selectFeed(feedId);

		int feedCount = feedDAO.deleteFeed(feedId, userId);
		
		if(feedCount != 1) {
			return false;
		}
		
		FileManager fileManager = new FileManager();
		fileManager.removeFile(feed.getImgUrl());
		
		likeBO.deleteLikeIfDeleteFeed(feedId);
		commentBO.deleteCommentIfDeleteFeed(feedId);
		
		return true;
	}
	
	public List<FeedWithCommentAndLike> getFeedList(int userId) {
		List<Feed> feedList = feedDAO.selectFeedList();			
		
		List<FeedWithCommentAndLike> feedWithCommentAndLikeList = new ArrayList<>();
		
		for(Feed feed : feedList) {
			List<Comment> commentList = commentBO.getCommentList(feed.getId());	
			boolean isLike = likeBO.existLike(feed.getId(), userId);
			int feedLikeCount = likeBO.getFeedLikeCount(feed.getId());
			int feedCommentCount = commentBO.getCommentCount(feed.getId());
			
			FeedWithCommentAndLike feedWithCommentAndLike = new FeedWithCommentAndLike();
			
			feedWithCommentAndLike.setFeed(feed);
			feedWithCommentAndLike.setCommentList(commentList);
			feedWithCommentAndLike.setLike(isLike);
			feedWithCommentAndLike.setLikeCount(feedLikeCount);
			feedWithCommentAndLike.setCommentCount(feedCommentCount);
			
			feedWithCommentAndLikeList.add(feedWithCommentAndLike);
		}
		
		return feedWithCommentAndLikeList;
	}
	
	public List<FeedWithCommentAndLike> getFeedListByUserId(int userId) {
		List<Feed> feedList = feedDAO.selectFeedListByUserId(userId);			
		
		List<FeedWithCommentAndLike> feedWithCommentAndLikeList = new ArrayList<>();
		
		for(Feed feed : feedList) {
			List<Comment> commentList = commentBO.getCommentList(feed.getId());	
			boolean isLike = likeBO.existLike(feed.getId(), userId);
			int feedCount = feedDAO.selectFeedCount(feed.getId());
			int feedLikeCount = likeBO.getFeedLikeCount(feed.getId());
			int feedCommentCount = commentBO.getCommentCount(feed.getId());
			
			FeedWithCommentAndLike feedWithCommentAndLike = new FeedWithCommentAndLike();
			
			feedWithCommentAndLike.setFeed(feed);
			feedWithCommentAndLike.setCommentList(commentList);
			feedWithCommentAndLike.setLike(isLike);
			feedWithCommentAndLike.setFeedCount(feedCount);
			feedWithCommentAndLike.setLikeCount(feedLikeCount);
			feedWithCommentAndLike.setCommentCount(feedCommentCount);
			
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
	
	public boolean like(int feedId, int userId) {
		return likeBO.like(feedId, userId);
	}
	
	public int deleteLikeIfDeleteFeed(int feedId) {
		return likeBO.deleteLikeIfDeleteFeed(feedId);
	}
}