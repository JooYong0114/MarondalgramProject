package com.allured.marondalgram.feed.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.allured.marondalgram.feed.like.model.Like;

@Repository
public interface LikeDAO {
	public int insertLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public List<Like> selectLikeList(@Param("feedId") int feedId);
	
	public int deleteLike(@Param("feedId") int feedId
			, @Param("userId") int userId);
	
	public int deleteLikeIfDeleteFeed(@Param("feedId") int feedId);
}