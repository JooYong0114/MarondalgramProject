package com.allured.marondalgram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public int insertUserInfo(@Param("loginId") String loginId
			, @Param("name") String name
			, @Param("nickname") String nickname
			, @Param("email") String email
			, @Param("password") String password);
}