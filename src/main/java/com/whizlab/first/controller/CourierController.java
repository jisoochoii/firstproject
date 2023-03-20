package com.whizlab.first.controller;

import com.whizlab.first.service.CourierService;
import com.whizlab.first.vo.*;
import com.whizlab.first.vo.CourierVO;
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
public class CourierController {
    @Autowired
    private CourierService service;

    @RequestMapping("/courier")
    public ModelAndView courier(ModelAndView model, HttpSession session) throws Exception {
        List<CommonCodeVO> useList = service.commonCodeUsage();

        List<BizVO> bizList = service.bizList();

        List<CourierVO> courierList = service.courierList((int)session.getAttribute("bizCode"));
        List<CenterVO> centerList = service.centerList((int)session.getAttribute("bizCode"));

        model.addObject("courierList", courierList);
        model.addObject("useList",useList);
        model.addObject("bizList",bizList);
        model.addObject("centerList",centerList);
        model.setViewName("/courier/courierList");
        //model.setViewName("/courier/co");
        return model;
    }

    @RequestMapping("/searchCourier")
    @ResponseBody
    public Map<String, Object> searchCourier(String search, String searchOption, int courierBizCode) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("searchOption", searchOption);
        map.put("courierBizCode", courierBizCode);

        List<CourierVO> courierList = service.searchCourier(map);

        map.put("searchList", courierList);
        return map;
    }

    @RequestMapping("/ajaxCourier")
    @ResponseBody
    public Map<String, Object> ajaxCourier(int courierSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();

        CourierVO courierList = service.courierView(courierSeq);

        map.put("viewList", courierList);
        return map;
    }

    @RequestMapping("/courierInsert")
    public String insertCourier(CourierVO courier) throws Exception {
        courier.setCourierCode(service.getMaxNum());

        if(courier != null){
            service.insertCourier(courier);
        }

        return "redirect:/courier";
    }

    @RequestMapping("/updateCourier")
    public String updateCourier(CourierVO courier) throws Exception {
        if(courier != null){
            service.updateCourier(courier);
        }

        return "redirect:/courier";
    }

    @RequestMapping("/deleteCourier")
    public String deleteCourier(CourierVO courier) throws Exception {
        if(courier != null){
            service.deleteCourier(courier);
        }

        return "redirect:/courier";
    }
}
