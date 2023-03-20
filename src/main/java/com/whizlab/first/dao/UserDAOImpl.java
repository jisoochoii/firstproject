package com.whizlab.first.dao;

import java.util.List;

import com.whizlab.first.vo.CustomerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.whizlab.first.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.whizlab.user";

	@Override
	public UserVO UserLogin(UserVO user) throws Exception {
		return (UserVO) session.selectOne(namespace + ".userLogin", user);
	}

	@Override
	public List<UserVO> UserList() throws Exception {
		return session.selectList(namespace + ".userList");
	}

	@Override
	public void UserUpdate(UserVO user) throws Exception {
		session.update(namespace + ".userUpdate", user);
	}

	@Override
	public void UserInsert(UserVO user) throws Exception {
		session.insert(namespace + ".userInsert", user);
	}

	@Override
	public int IDCheck(String userID) throws Exception {
		return session.selectOne(namespace + ".IDCheck", userID);
	}

}
