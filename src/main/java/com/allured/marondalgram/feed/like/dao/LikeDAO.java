package com.allured.marondalgram.feed.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	public int insertLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int seleteLikeCount(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int seleteFeedLikeCount(@Param("feedId") int feedId);
	
	public int deleteLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int deleteLikeIfDeleteFeed(@Param("feedId") int feedId);
}