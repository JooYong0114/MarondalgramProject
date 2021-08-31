package com.allured.marondalgram.feed.model;

import java.util.List;

import com.allured.marondalgram.feed.comment.model.Comment;
import com.allured.marondalgram.feed.like.model.Like;

public class FeedWithCommentAndLike {
	private Feed feed;
	private List<Comment> commentList;
	private List<Like> likeList;
	
	public Feed getFeed() {
		return feed;
	}
	public void setFeed(Feed feed) {
		this.feed = feed;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public List<Like> getLikeList() {
		return likeList;
	}
	public void setLikeList(List<Like> likeList) {
		this.likeList = likeList;
	}
}