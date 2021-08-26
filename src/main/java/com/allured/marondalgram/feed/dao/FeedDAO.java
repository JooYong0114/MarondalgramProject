package com.allured.marondalgram.feed.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.allured.marondalgram.feed.model.Feed;

@Repository
public interface FeedDAO {

	public int insertFeed(@Param("userId") int userId
			, @Param("userNickname") String userNickname
			, @Param("content") String content
			, @Param("imgUrl") String imageUrl);
	
	public List<Feed> selectFeedList();
	
	public int insertLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int selectLikeCount(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int deleteLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
}