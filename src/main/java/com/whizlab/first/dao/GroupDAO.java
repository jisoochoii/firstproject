package com.whizlab.first.dao;

import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.UserGroupVO;
import com.whizlab.first.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface GroupDAO {
    public List<GroupVO> groupList() throws Exception;
    public List<UserGroupVO> ajaxGroupList(int groupSeq) throws Exception;

    public List<UserVO> groupUserSearch(Map<String, Object> map) throws Exception;
    public List<UserGroupVO> ajaxUserList(int userSeq) throws Exception;

    public void userGroupInsert(Map<String, Object> map) throws Exception;
    public void groupInsert(GroupVO group) throws Exception;
    public void groupUserDel(int ugSeq) throws Exception;
}
