package com.whizlab.first.dao;

import java.util.List;

import com.whizlab.first.vo.UserVO;

public interface UserDAO {
	public UserVO UserLogin(UserVO user) throws Exception;
	public List<UserVO> UserList() throws Exception;
	public void UserUpdate(UserVO admin) throws Exception;
	public void UserInsert(UserVO admin) throws Exception;
	public int IDCheck(String userID) throws Exception;
}
