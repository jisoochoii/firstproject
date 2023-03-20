package com.whizlab.first.service;

import java.util.List;

import com.whizlab.first.vo.UserVO;

public interface UserService {
	public UserVO UserLogin(UserVO user) throws Exception;
	public List<UserVO> UserList() throws Exception;
	public void UserUpdate(UserVO user) throws Exception;
	public void UserInsert(UserVO user) throws Exception;
	public int IDCheck(String userID) throws Exception;
}
