package com.whizlab.first.service;

import com.whizlab.first.dao.GroupDAO;
import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.UserGroupVO;
import com.whizlab.first.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GroupServiceImpl implements GroupService {
    @Autowired
    private GroupDAO dao;

    @Override
    public List<GroupVO> groupList() throws Exception {
        return dao.groupList();
    }

    @Override
    public List<UserGroupVO> ajaxGroupList(int groupSeq) throws Exception {
        return dao.ajaxGroupList(groupSeq);
    }

    @Override
    public List<UserVO> groupUserSearch(Map<String, Object> map) throws Exception {
        return dao.groupUserSearch(map);
    }

    @Override
    public List<UserGroupVO> ajaxUserList(int userSeq) throws Exception {
        return dao.ajaxUserList(userSeq);
    }

    @Override
    public void userGroupInsert(Map<String, Object> map) throws Exception {
        dao.userGroupInsert(map);
    }

    @Override
    public void groupInsert(GroupVO group) throws Exception {
        dao.groupInsert(group);
    }

    @Override
    public void groupUserDel(int ugSeq) throws Exception {
        dao.groupUserDel(ugSeq);
    }
}
