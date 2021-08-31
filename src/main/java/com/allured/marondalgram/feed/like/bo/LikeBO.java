package com.allured.marondalgram.feed.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.marondalgram.feed.like.dao.LikeDAO;
import com.allured.marondalgram.feed.like.model.Like;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int feedId, int userId) {
		return likeDAO.insertLike(feedId, userId);
	}
	
	public List<Like> getLikeList(int feedId) {
		return likeDAO.selectLikeList(feedId);
	}
	
	public int deleteLike(int feedId, int userId) {
		return likeDAO.deleteLike(feedId, userId);
	}
	
	public int deleteLikeIfDeleteFeed(int feedId) {
		return likeDAO.deleteLikeIfDeleteFeed(feedId);
	}
}