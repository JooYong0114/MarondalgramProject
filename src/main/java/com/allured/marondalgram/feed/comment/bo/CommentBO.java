package com.allured.marondalgram.feed.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.marondalgram.feed.comment.dao.CommentDAO;
import com.allured.marondalgram.feed.comment.model.Comment;

@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, String userNickname, int feedId, String comment) {
		return commentDAO.insertComment(userId, userNickname, feedId, comment);
	}
	
	public List<Comment> getCommentList(int feedId) {
		return commentDAO.selectCommentList(feedId);
	}
	
	public int deleteCommentIfDeleteFeed(int feedId) {
		return commentDAO.deleteCommentIfDeleteFeed(feedId);
	}
	
	public int getCommentCount(int feedId) {
		return commentDAO.selectCommentCount(feedId);
	}
}