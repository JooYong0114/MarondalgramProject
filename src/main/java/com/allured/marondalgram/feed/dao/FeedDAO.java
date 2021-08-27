package com.allured.marondalgram.feed.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.allured.marondalgram.feed.model.Comment;
import com.allured.marondalgram.feed.model.Feed;
import com.allured.marondalgram.feed.model.Like;

@Repository
public interface FeedDAO {

	public int insertFeed(@Param("userId") int userId
			, @Param("userNickname") String userNickname
			, @Param("content") String content
			, @Param("imgUrl") String imageUrl);
	
	public int deleteFeed(@Param("id") int id);
	
	public List<Feed> selectFeedList();
	
	public int insertLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public List<Like> selectLikeList();
	
	public int deleteLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int deleteLikeIfDeleteFeed(@Param("feedId") int feedId);
	
	public int insertComment(@Param("userId") int userId
			, @Param("userNickname") String userNickname
			, @Param("feedId") int feedId
			, @Param("comment") String comment);
	
	public List<Comment> selectCommentList();
	
	public int deleteComment(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int deleteCommentIfDeleteFeed(@Param("feedId") int feedId);
}