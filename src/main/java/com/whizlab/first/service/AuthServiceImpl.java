package com.whizlab.first.service;

import com.whizlab.first.dao.AuthDAO;
import com.whizlab.first.vo.GroupScreenVO;
import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.ScreenVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AuthServiceImpl implements AuthService{
    @Autowired
    private AuthDAO dao;

    @Override
    public List<GroupVO> authGroupList() throws Exception {
        return dao.authGroupList();
    }

    @Override
    public List<ScreenVO> notAuthGroup(int groupSeq) throws Exception {
        return dao.notAuthGroup(groupSeq);
    }

    @Override
    public List<GroupScreenVO> inAuthGroup(int groupSeq) throws Exception {
        return dao.inAuthGroup(groupSeq);
    }

    @Override
    public void insertScreenGroup(Map<String, Object> sgList) throws Exception {
        dao.insertScreenGroup(sgList);
    }

    @Override
    public void deleteScreenGroup(Map<String, Object> sgList) throws Exception {
        dao.deleteScreenGroup(sgList);
    }
}
