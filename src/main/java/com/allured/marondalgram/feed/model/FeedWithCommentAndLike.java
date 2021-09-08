package com.allured.marondalgram.feed.model;

import java.util.List;

import com.allured.marondalgram.feed.comment.model.Comment;

public class FeedWithCommentAndLike {
	private Feed feed;
	private List<Comment> commentList;
	private boolean isLike;
	private int feedCount;
	private int likeCount;
	private int commentCount;
	
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
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public int getFeedCount() {
		return feedCount;
	}
	public void setFeedCount(int feedCount) {
		this.feedCount = feedCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
}