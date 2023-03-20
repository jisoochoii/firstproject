package com.whizlab.first.controller;

import com.whizlab.first.service.ProductService;
import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CustomerVO;
import com.whizlab.first.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    @Autowired
    private ProductService service;

    @RequestMapping("/product")
    public ModelAndView product(ModelAndView model) throws Exception {
        List<BizVO> bizList             = service.bizList();
        List<CustomerVO> customerList   = service.customerList();
        List<ProductVO> productList     = service.productList();

        List<CommonCodeVO> useList      = service.commonCodeUsage();
        List<CommonCodeVO> catList      = service.commonCodeCategory();
        List<CommonCodeVO> prodAreaList = service.commonCodeProductArea();
        List<CommonCodeVO> itemList     = service.commonCodeProductItem();
        List<CommonCodeVO> classList    = service.commonCodeProductClassified();
        List<CommonCodeVO> webList      = service.commonCodeProductWeb();
        List<CommonCodeVO> pickList     = service.commonCodeProductPicking();
        List<CommonCodeVO> unitList     = service.commonCodeProductBasicUnit();
        List<CommonCodeVO> taxList      = service.commonCodeProductTax();
        List<CommonCodeVO> deliveryList = service.commonCodeProductDeliveryDate();
        List<CommonCodeVO> stockList    = service.commonCodeProductStock();
        List<CommonCodeVO> originList   = service.commonCodeProductOrigin();
//        List<CommonCodeVO> manageList   = service.commonCodeProductManage();

        model.addObject("bizList",bizList);
        model.addObject("customerList",customerList);
        model.addObject("productList",productList);

        model.addObject("catList",catList);
        model.addObject("useList",useList);
        model.addObject("prodAreaList",prodAreaList);
        model.addObject("itemList",itemList);
        model.addObject("classList",classList);
        model.addObject("webList",webList);
        model.addObject("pickList",pickList);
        model.addObject("unitList",unitList);
        model.addObject("taxList",taxList);
        model.addObject("deliveryList",deliveryList);
        model.addObject("stockList",stockList);
        model.addObject("originList",originList);
//        model.addObject("manageList",manageList);
        model.setViewName("/product/productList");
        return model;
    }

    @RequestMapping("/productView")
    @ResponseBody
    public Map<String, Object> productView(int prodSeq) throws Exception {
        Map<String, Object> map = new HashMap<>();

        ProductVO product = service.productView(prodSeq);

        map.put("productList", product);
        return map;
    }

    @RequestMapping("/optionBizArea")
    @ResponseBody
    public Map<String, Object> optionBizArea(int bizCategory) throws Exception {
        Map<String, Object> map = new HashMap<>();

        List<BizVO> bizList = service.optionBizArea(bizCategory);

        map.put("bizList", bizList);
        return map;
    }

    @RequestMapping("/optionBizCode")
    @ResponseBody
    public Map<String, Object> optionBizCode(int customerBizCode) throws Exception {
        Map<String, Object> map = new HashMap<>();

        List<CustomerVO> customerList = service.optionBizCode(customerBizCode);

        map.put("customerList", customerList);
        return map;
    }

    @RequestMapping("/getDealDates")
    @ResponseBody
    public Map<String, Object> getDealDates(int customerCode) throws Exception {
        Map<String, Object> map = new HashMap<>();

        CustomerVO customer = service.getDealDates(customerCode);

        map.put("customer",customer);
        return map;
    }

    @RequestMapping("/insertProduct")
    public String insertProduct(ProductVO prod) throws Exception{
        //        prod.setProdCode(service.getMaxProductCodeNum(prod.getProdBizCode()));
//        prod.setProdBarcode(""+prod.getProdCode());

        if(prod != null){
            service.insertProduct(prod);
        }

        return "redirect:/product";
    }

    @RequestMapping("/updateProduct")
    public String updateProduct(ProductVO prod) throws Exception{
        if(prod != null){
            service.updateProduct(prod);
        }

        return "redirect:/product";
    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(ProductVO prod) throws Exception{
        if(prod != null){
            service.deleteProduct(prod);
        }

        return "redirect:/product";
    }

    @RequestMapping("/searchProduct")
    @ResponseBody
    public Map<String, Object> searchProduct(int categorySelect, int usageSelect, int productAreaSelect, int prodItemSelect, String bizName, String prodName) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("categorySelect",categorySelect);
        map.put("usageSelect",usageSelect);
        map.put("productAreaSelect",productAreaSelect);
        map.put("prodItemSelect",prodItemSelect);
        map.put("bizName",bizName);
        map.put("prodName",prodName);

        List<ProductVO> productList = service.searchProduct(map);

        map.put("productList", productList);
        return map;
    }
}
