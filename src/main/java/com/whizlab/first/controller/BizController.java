package com.whizlab.first.controller;

import com.whizlab.first.service.BizService;
import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.BrandVO;
import com.whizlab.first.vo.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BizController {
    @Autowired
    private BizService service;

    // table
    @RequestMapping("/biz")
    public ModelAndView biz(ModelAndView model) throws Exception{
        List<BizVO> bizList = service.bizList();

        model.addObject("bizList",bizList);
        model.setViewName("/biz/bizList");
        return model;
    }

    @RequestMapping("/writeBiz")
    public ModelAndView writeBiz(ModelAndView model) throws Exception {
        List<CommonCodeVO> regionList = service.commonCodeRegion();
        List<CommonCodeVO> emailList = service.commonCodeEmail();
        List<CommonCodeVO> bankList = service.commonCodeBank();
        List<CommonCodeVO> useList = service.commonCodeUsage();
        List<CommonCodeVO> catList = service.commonCodeCategory();

        model.addObject("emailList", emailList);
        model.addObject("useList", useList);
        model.addObject("regionList", regionList);
        model.addObject("bankList", bankList);
        model.addObject("catList", catList);
        model.setViewName("/biz/bizWrite");
        return model;
    }

    @RequestMapping("/editBiz")
    public ModelAndView editBiz(ModelAndView model, int bizSeq, HttpSession session) throws Exception{
        BizVO bizList = service.bizViewList(bizSeq);

        List<CommonCodeVO> emailList = service.commonCodeEmail();
        List<CommonCodeVO> regionList = service.commonCodeRegion();
        List<CommonCodeVO> bankList = service.commonCodeBank();
        List<CommonCodeVO> useList = service.commonCodeUsage();
        List<CommonCodeVO> catList = service.commonCodeCategory();

        List<BizVO> business = service.bizList();
        List<BrandVO> brandList = service.brandList(bizList.getBizCode());

        model.addObject("bizList", bizList);
        model.addObject("business", business);
        model.addObject("emailList", emailList);
        model.addObject("useList", useList);
        model.addObject("regionList", regionList);
        model.addObject("bankList", bankList);
        model.addObject("catList", catList);
        model.addObject("brandList", brandList);
        model.setViewName("/biz/bizView");
        return model;
    }

    @RequestMapping("insertBiz")
    public String insertBiz(BizVO biz) throws Exception {
        biz.setBizCode(service.bizMaxNum(biz.getBizCategory()));

        if(biz != null) {
            service.insertBiz(biz);
        }

        return "redirect:/biz";
    }

    @RequestMapping("updateBiz")
    public String updateBiz(BizVO biz) throws Exception {
        if(biz != null){
            service.updateBiz(biz);
        }

        return "redirect:/biz";
    }

    @RequestMapping("deleteBiz")
    public String deleteBiz(BizVO biz) throws Exception {
        if(biz != null){
            service.deleteBiz(biz);
        }

        return "redirect:/biz";
    }

    @RequestMapping("/saveBrand")
    @ResponseBody
    public Map<String, Object> saveBrand(BrandVO brand) throws Exception {
        Map<String, Object> map = new HashMap<>();

        if(brand != null){
            service.saveBrand(brand);
        }

        List<BrandVO> brandList = service.brandList(brand.getBrandBizCode());

        map.put("brandList", brandList);
        return map;
    }

    @RequestMapping("/deleteBrand")
    @ResponseBody
    public Map<String, Object> deleteBrand(BrandVO brand) throws Exception {
        Map<String, Object> map = new HashMap<>();

        if(brand != null){
            service.deleteBrand(brand);
        }

        List<BrandVO> brandList = service.brandList(brand.getBrandBizCode());

        map.put("brandList", brandList);
        return map;
    }

    @RequestMapping("/selector")
    @ResponseBody
    public Map<String, Object> selector(String selector) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("selector", selector);

        List<BizVO> bizList = service.selectCategory(map);
        map.put("bizList", bizList);
        return map;
    }

    @RequestMapping("/search")
    @ResponseBody
    public Map<String, Object> search(String search, String searchOption, String selector) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("selector", selector);
        map.put("searchOption", searchOption);

        List<BizVO> bizList = service.searchTable(map);

        map.put("bizList", bizList);
        return map;
    }
}
