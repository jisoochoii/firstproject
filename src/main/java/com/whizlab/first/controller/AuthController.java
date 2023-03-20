package com.whizlab.first.controller;

import com.whizlab.first.service.AuthService;
import com.whizlab.first.vo.GroupScreenVO;
import com.whizlab.first.vo.GroupVO;
import com.whizlab.first.vo.ScreenVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AuthController {
    @Autowired
    private AuthService service;

    @RequestMapping("/auth")
    public ModelAndView authList(ModelAndView model) throws Exception {
        List<GroupVO> groupList = service.authGroupList();
        model.addObject("authGroup", groupList);
        model.setViewName("/auth/authList");
        return model;
    }

    @RequestMapping("/groupScreenList")
    @ResponseBody
    public Map<String, Object> groupScreenList(int groupSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();

        List<GroupScreenVO> sgInList = service.inAuthGroup(groupSeq);
        List<ScreenVO> sgOutList = service.notAuthGroup(groupSeq);

        map.put("outList", sgOutList);
        map.put("inList", sgInList);

        return map;
    }

    @ResponseBody
    @RequestMapping("/ajaxScreenGroupInsert")
    public Map<String, Object> ajaxScreenGroupInsert(@RequestBody List<GroupScreenVO> sgList) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("list", sgList);

        service.insertScreenGroup(map);

        List<GroupScreenVO> sgInList = service.inAuthGroup(sgList.get(0).getSgGroupSeq());
        List<ScreenVO> sgOutList = service.notAuthGroup(sgList.get(0).getSgGroupSeq());

        map.put("outList", sgOutList);
        map.put("inList", sgInList);

        return map;
    }


    @ResponseBody
    @RequestMapping("/ajaxScreenGroupDelete")
    public Map<String, Object> ajaxScreenGroupDelete(@RequestBody List<GroupScreenVO> sgList) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("list", sgList);

        service.deleteScreenGroup(map);

        List<GroupScreenVO> sgInList = service.inAuthGroup(sgList.get(0).getSgGroupSeq());
        List<ScreenVO> sgOutList = service.notAuthGroup(sgList.get(0).getSgGroupSeq());

        map.put("outList", sgOutList);
        map.put("inList", sgInList);

        return map;
    }
}
