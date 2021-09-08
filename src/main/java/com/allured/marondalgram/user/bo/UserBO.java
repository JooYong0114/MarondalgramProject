package com.allured.marondalgram.user.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.marondalgram.common.EncryptUtils;
import com.allured.marondalgram.feed.comment.model.Comment;
import com.allured.marondalgram.feed.model.Feed;
import com.allured.marondalgram.feed.model.FeedWithCommentAndLike;
import com.allured.marondalgram.user.dao.UserDAO;
import com.allured.marondalgram.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId
			, String name
			, String nickname
			, String email
			, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.insertUserInfo(loginId, name, nickname, email, encryptPassword);
	}
	
	public boolean idDuplicateCheck(
			String loginId) {
		
		if(userDAO.selectUserInfoById(loginId) == 0) {
			return false;
		}
		else {
			return true;
		}
	}
	
	public User login(String loginId
			, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectUserInfoByIdPassword(loginId, encryptPassword);
	}
	
	public User getUser(String nickname) {
		return userDAO.selectUserInfo(nickname);
	}
	
	public List<User> getUserList() {
		return userDAO.selectUserList();
	}
}