package com.allured.marondalgram.feed.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.allured.marondalgram.feed.comment.model.Comment;

@Repository
public interface CommentDAO {
	public int insertComment(@Param("userId") int userId
			, @Param("userNickname") String userNickname
			, @Param("feedId") int feedId
			, @Param("comment") String comment);
	
	public List<Comment> selectCommentList(@Param("feedId") int feedId);
	
	public int deleteComment(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int deleteCommentIfDeleteFeed(@Param("feedId") int feedId);
}