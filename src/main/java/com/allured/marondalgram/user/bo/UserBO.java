package com.allured.marondalgram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allured.marondalgram.common.EncryptUtils;
import com.allured.marondalgram.user.dao.UserDAO;

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
}