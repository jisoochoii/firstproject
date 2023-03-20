package com.whizlab.first.controller;

import com.whizlab.first.service.CommonCodeService;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.MainCommonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommonCodeController {
    @Autowired
    private CommonCodeService service;

    @RequestMapping("/cc")
    public ModelAndView mainCommonCode(ModelAndView model) throws Exception {
        List<MainCommonVO> mainCodeList = service.mainCommonList();

        model.addObject("mainCodeList", mainCodeList);
        model.setViewName("/common/commonCodeList");
        return model;
    }

    @RequestMapping("/ajaxCommonCode")
    @ResponseBody
    public Map<String, Object> commonCodeList(int commonCodeType) throws Exception {
        Map<String, Object> map = new HashMap<>();
        List<CommonCodeVO> commonList = service.commonCodeList(commonCodeType);
        map.put("commonList", commonList);

        return map;
    }

    @RequestMapping("/mainCodeInsert")
    public String mainCodeInsert(MainCommonVO main) throws Exception {
        if(main != null){
            service.mainCodeInsert(main);
        }

        return "redirect:/cc";
    }

    @RequestMapping("/mainCodeDel")
    public String mainCodeDelete(ModelAndView model, MainCommonVO main) throws Exception {
        if(main != null){
            service.mainCodeDelete(main);
        }

        return "redirect:/cc";
    }

    @RequestMapping("/insertCommonCode")
    @ResponseBody
    public Map<String, Object> insertCommonCode(CommonCodeVO common) throws Exception {
        Map<String, Object> map = new HashMap<>();

        common.setCommonCodeNumber(service.commonMaxNum(common.getCommonCodeType()));

        if(common != null){
            service.commonCodeInsert(common);
        }

        List<CommonCodeVO> commonCodeList = service.commonCodeList(common.getCommonCodeType());
        map.put("commonList", commonCodeList);
        return map;
    }

    @RequestMapping("/deleteCommonCode")
    @ResponseBody
    public Map<String, Object> deleteCommonCode(CommonCodeVO common) throws Exception {
        Map<String, Object> map = new HashMap<>();

        if(common != null){
            service.commonCodeDelete(common);
        }

        List<CommonCodeVO> commonCodeList = service.commonCodeList(common.getCommonCodeType());
        map.put("commonList", commonCodeList);
        return map;
    }

}
