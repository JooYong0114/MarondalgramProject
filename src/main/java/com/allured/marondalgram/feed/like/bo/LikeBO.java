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
	
	public boolean like(int feedId, int userId) {
		
		if(this.existLike(feedId, userId)) {
			likeDAO.deleteLike(feedId, userId);
			return false;
		}
		else {
			likeDAO.insertLike(feedId, userId);
			return true;
		}
	}
	
	public boolean existLike(int feedId, int userId) {
		int selectCount = likeDAO.seleteLikeCount(feedId, userId);
		
		if(selectCount >= 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public int getFeedLikeCount(int feedId) {
		return likeDAO.seleteFeedLikeCount(feedId);
	}
	
	public int deleteLikeIfDeleteFeed(int feedId) {
		return likeDAO.deleteLikeIfDeleteFeed(feedId);
	}
}