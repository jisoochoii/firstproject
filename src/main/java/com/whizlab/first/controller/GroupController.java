package com.whizlab.first.controller;

import com.whizlab.first.service.GroupService;
import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.UserGroupVO;
import com.whizlab.first.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class GroupController {
    @Autowired
    private GroupService service;

    @RequestMapping("/group")
    public ModelAndView groupList(ModelAndView model) throws Exception {
        List<GroupVO> group = service.groupList();
        model.addObject("groupList", group);
        model.setViewName("/group/groupList");
        return model;
    }

    @RequestMapping("/groupUserList")
    @ResponseBody
    public Map<String, Object> ajaxGroupList(int groupSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();
        List<UserGroupVO> userGroup = service.ajaxGroupList(groupSeq);
        map.put("groupList", userGroup);
        return map;
    }


    @RequestMapping("/groupUserSearch")
    @ResponseBody
    public Map<String, Object> groupUserSearch(String keyword, int groupSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("groupSeq", groupSeq);

        List<UserVO> userList = service.groupUserSearch(map);
        map.put("userList", userList);
        return map;
    }

    @RequestMapping("/userList")
    @ResponseBody
    public Map<String, Object> ajaxUserList(int userSeq, int ugGroupSeq, int ugUserSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("userSeq", userSeq);
        map.put("ugGroupSeq", ugGroupSeq);
        map.put("ugUserSeq", ugUserSeq);

        service.userGroupInsert(map);

        List<UserGroupVO> userGroup = service.ajaxGroupList((int)map.get("ugGroupSeq"));
        map.put("userList", userGroup);
        return map;
    }

    @RequestMapping("/groupInsert")
    public ModelAndView groupInsert(ModelAndView model, GroupVO group) throws Exception {
        service.groupInsert(group);

        List<GroupVO> groupList = service.groupList();
        model.addObject("groupList",groupList);
        model.setViewName("/group/groupList");
        return model;
    }

    @RequestMapping("/groupUserDel")
    @ResponseBody
    public Map<String, Object> groupUserDel(int ugSeq, int ugGroupSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();

        service.groupUserDel(ugSeq);

        List<UserGroupVO> userGroup = service.ajaxGroupList(ugGroupSeq);
        map.put("userList", userGroup);
        return map;
    }
}
