package com.whizlab.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whizlab.first.dao.UserDAO;
import com.whizlab.first.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public UserVO UserLogin(UserVO user) throws Exception {
		return dao.UserLogin(user);
	}

	@Override
	public List<UserVO> UserList() throws Exception {
		return dao.UserList();
	}

	@Override
	public void UserUpdate(UserVO user) throws Exception {
		dao.UserUpdate(user);
	}

	@Override
	public void UserInsert(UserVO user) throws Exception {
		dao.UserInsert(user);
	}
	@Override
	public int IDCheck(String userID) throws Exception{
		return dao.IDCheck(userID);
	}
}
