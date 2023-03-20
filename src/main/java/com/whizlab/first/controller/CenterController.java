package com.whizlab.first.controller;

import com.whizlab.first.service.CenterService;
import com.whizlab.first.vo.CenterVO;
import com.whizlab.first.vo.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CenterController {

    @Autowired
    private CenterService service;

    @RequestMapping("/center")
    public ModelAndView center(ModelAndView model) throws Exception {
        List<CenterVO> centerList = service.centerList();

        List<CommonCodeVO> useList = service.commonCodeUsage();
        List<CommonCodeVO> emailList = service.commonCodeEmail();

        model.addObject("centerList",centerList);
        model.addObject("useList",useList);
        model.addObject("emailList",emailList);
        model.setViewName("/center/centerList");
        return model;
    }

    @RequestMapping("/searchCenter")
    @ResponseBody
    public Map<String, Object> searchCenter(String search, String searchOption, int centerBizCode) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("searchOption", searchOption);
        map.put("centerBizCode", centerBizCode);

        List<CenterVO> centerList = service.searchCenter(map);

        map.put("searchList", centerList);
        return map;
    }

    @RequestMapping("/ajaxCenter")
    @ResponseBody
    public Map<String, Object> ajaxCenter(int centerSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();

        CenterVO centerList = service.centerView(centerSeq);

        map.put("viewList", centerList);
        return map;
    }

    @RequestMapping("/insertCenter")
    public String insertCenter(CenterVO center) throws Exception {
//        System.out.println("centerCode : " + center.getCenterBizCode());
        center.setCenterCode(service.getCenterMaxNum(center.getCenterBizCode()));

        if(center != null){
            service.insertCenter(center);
        }

        return "redirect:/center";
    }

    @RequestMapping("/updateCenter")
    public String updateCenter(CenterVO center) throws Exception {
        if(center != null){
            service.updateCenter(center);
        }

        return "redirect:/center";
    }

    @RequestMapping("/deleteCenter")
    public String deleteCenter(CenterVO center) throws Exception {
        if(center != null){
            service.deleteCenter(center);
        }

        return "redirect:/center";
    }
}
