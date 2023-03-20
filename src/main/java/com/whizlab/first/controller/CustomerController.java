package com.whizlab.first.controller;

import com.whizlab.first.service.CustomerService;
import com.whizlab.first.vo.*;
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
public class CustomerController {
    @Autowired
    private CustomerService service;


    @RequestMapping("/customer")
    public ModelAndView customer(ModelAndView model) throws Exception {
        List<CustomerVO> customerList       =   service.customerList();

        List<CenterVO> centerList           =   service.centerList();
        List<BizVO> bizList                 =   service.bizList();
        List<BrandVO> brandList             =   service.brandList();

        List<CommonCodeVO> catList          =   service.commonCodeCategory();
        List<CommonCodeVO> emailList        =   service.commonCodeEmail();
        List<CommonCodeVO> usageList        =   service.commonCodeUsage();

        List<CommonCodeVO> paymentList      =   service.commonCodePayment();
        List<CommonCodeVO> payMethodList    =   service.commonCodePayMethod();
        List<CommonCodeVO> bankList         =   service.commonCodeBank();
        List<CommonCodeVO> guaranteeList    =   service.commonCodeGuarantee();
        List<CommonCodeVO> saleUnitList     =   service.commonCodeSaleUnit();
        List<CommonCodeVO> categoryList     =   service.commonCodeCustomerCategory();
        List<CommonCodeVO> discountList     =   service.commonCodeDiscount();

        model.addObject("customerList",customerList);
        model.addObject("catList",catList);                 // 운영구분
        model.addObject("centerList",centerList);           // 센터
        model.addObject("bizList",bizList);                 // 사업장
        model.addObject("brandList",brandList);             // 브랜드
        model.addObject("emailList",emailList);             // 이메일
        model.addObject("usageList",usageList);             // 사용여부
        model.addObject("paymentList",paymentList);         // 결제구분
        model.addObject("payMethodList",payMethodList);     // 결제방법
        model.addObject("bankList",bankList);               // 은행
        model.addObject("guaranteeList",guaranteeList);     // 담보
        model.addObject("saleUnitList",saleUnitList);       // 판매단가
        model.addObject("categoryList",categoryList);       // 거래처구분
        model.addObject("discountList",discountList);       // DC율

        model.setViewName("/customer/customerList");
        return model;
    }

    @RequestMapping("/customerView")
    @ResponseBody
    public Map<String, Object> customerView(int customerSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();

        CustomerVO customerList = service.customerView(customerSeq);

        map.put("customerList",customerList);
        return map;
    }

    @RequestMapping("/searchCenters")
    @ResponseBody
    public Map<String, Object> searchCenter(String selector) throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("selector", selector);

        List<CourierVO> courierList = service.searchCenter(map);

        map.put("courierList",courierList);
        return map;
    }

    @RequestMapping("/searchTable")
    @ResponseBody
    public Map<String, Object> searchTable(String selector, String search) throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("selector", selector);
        map.put("search", search);

        List<CourierVO> courierList = service.searchTable(map);

        map.put("courierList",courierList);
        return map;
    }

    @RequestMapping("/selectBizArea")
    @ResponseBody
    public Map<String, Object> selectBizArea(int bizCategory) throws Exception {
        Map<String,Object> map = new HashMap<>();

        List<BizVO> bizList = null;
        if(bizCategory == 8){
            bizList = service.selectBuyer();    // 매입
        } else {
            bizList = service.selectSeller();   // 매출
        }

        map.put("bizList",bizList);
        return map;
    }

    @RequestMapping("/selectBizCode")
    @ResponseBody
    public Map<String, Object> selectBizCode(int bizCode) throws Exception {
        Map<String,Object> map = new HashMap<>();

        List<BrandVO> brandList = service.selectBrand(bizCode);
        List<CenterVO> centerList = service.selectCenter(bizCode);

        map.put("brandList",brandList);
        map.put("centerList",centerList);
        return map;
    }

    @RequestMapping("/getEndTime")
    @ResponseBody
    public Map<String, Object> getEndTime(int brandCode) throws Exception {
        Map<String,Object> map = new HashMap<>();

        int endTime = 24;
        if(brandCode != 0){
            endTime = service.getEndTime(brandCode);
        }

        map.put("endTime",endTime);
        return map;
    }

    @RequestMapping("/searchSidebar")
    @ResponseBody
    public Map<String, Object> searchSidebar(String bizName, String brandName, String customerName, int selectUse, int selectCat, int selectBizArea) throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("selectUse",selectUse);
        map.put("selectCat",selectCat);
        map.put("selectBizArea",selectBizArea);
        map.put("bizName",bizName);
        map.put("brandName",brandName);
        map.put("customerName",customerName);

        List<CustomerVO> customerList = service.searchSidebar(map);

        map.put("customerList", customerList);
        return map;
    }

    @RequestMapping("/insertCustomer")
    public String insertCustomer(CustomerVO customer) throws Exception {
        customer.setCustomerCode(service.getCustomerMaxNum(customer.getCustomerBizCode()));
        customer.setCustomerWebID(""+customer.getCustomerCode());
        customer.setCustomerWebPW(""+customer.getCustomerCode());

        if(customer != null){
            service.insertCustomer(customer);
        }

        return "redirect:/customer";
    }

    @RequestMapping("/updateCustomer")
    public String updateCustomer(CustomerVO customer) throws Exception {
        if(customer != null){
            service.updateCustomer(customer);
        }

        return "redirect:/customer";
    }

    @RequestMapping("/deleteCustomer")
    public String deleteCustomer(CustomerVO customer) throws Exception {
        if(customer != null){
            service.deleteCustomer(customer);
        }

        return "redirect:/customer";
    }
}
