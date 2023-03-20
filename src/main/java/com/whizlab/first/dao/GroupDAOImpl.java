package com.whizlab.first.dao;

import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.UserGroupVO;
import com.whizlab.first.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupDAOImpl implements GroupDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.group";

    @Override
    public List<GroupVO> groupList() throws Exception {
        return session.selectList(namespace + ".groupList");
    }

    @Override
    public List<UserGroupVO> ajaxGroupList(int groupSeq) throws Exception {
        return session.selectList(namespace + ".ajaxGroupList", groupSeq);
    }

    @Override
    public List<UserVO> groupUserSearch(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".groupUserSearch", map);
    }

    @Override
    public List<UserGroupVO> ajaxUserList(int userSeq) throws Exception {
        return session.selectList(namespace+".ajaxUserList", userSeq);
    }

    @Override
    public void userGroupInsert(Map<String, Object> map) throws Exception {
        session.insert(namespace+".userGroupInsert", map);
    }

    @Override
    public void groupInsert(GroupVO group) throws Exception {
        session.insert(namespace+".groupInsert", group);
    }

    @Override
    public void groupUserDel(int ugSeq) throws Exception {
        session.delete(namespace + ".groupUserDel", ugSeq);
    }
}
