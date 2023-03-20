package com.whizlab.first.service;

import com.whizlab.first.vo.GroupScreenVO;
import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.ScreenVO;

import java.util.List;
import java.util.Map;

public interface AuthService {
    public List<GroupVO> authGroupList() throws Exception;
    public List<ScreenVO> notAuthGroup(int groupSeq) throws Exception;
    public List<GroupScreenVO> inAuthGroup(int groupSeq) throws Exception;
    public void insertScreenGroup(Map<String, Object> sgList) throws Exception;
    public void deleteScreenGroup(Map<String, Object> sgList) throws Exception;
}
