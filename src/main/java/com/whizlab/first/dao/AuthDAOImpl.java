package com.whizlab.first.dao;

import com.whizlab.first.vo.GroupScreenVO;
import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.ScreenVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class AuthDAOImpl implements AuthDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.auth";

    @Override
    public List<GroupVO> authGroupList() throws Exception {
        return session.selectList(namespace + ".authGroup");
    }

    @Override
    public List<ScreenVO> notAuthGroup(int groupSeq) throws Exception {
        return session.selectList(namespace+".notAuthGroup", groupSeq);
    }

    @Override
    public List<GroupScreenVO> inAuthGroup(int groupSeq) throws Exception {
        return session.selectList(namespace+".inAuthGroup", groupSeq);
    }

    @Override
    public void insertScreenGroup(Map<String, Object> sgList) throws Exception {
        session.insert(namespace + ".insertScreenGroup", sgList);
    }

    @Override
    public void deleteScreenGroup(Map<String, Object> sgList) throws Exception {
        session.delete(namespace + ".deleteScreenGroup", sgList);
    }
}
