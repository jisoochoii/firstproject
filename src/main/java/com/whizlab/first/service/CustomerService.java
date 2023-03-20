package com.whizlab.first.service;

import com.whizlab.first.vo.*;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    public List<CustomerVO> customerList() throws Exception;
    public CustomerVO customerView(int customerSeq) throws Exception;

    public List<CenterVO> centerList() throws Exception;
    public List<BizVO> bizList() throws Exception;
    public List<BrandVO> brandList() throws Exception;
    public int getCustomerMaxNum(int customerBizCode) throws Exception;

    // select option을 만들기 위해 존재
    public List<BizVO> selectBuyer() throws Exception;
    public List<BizVO> selectSeller() throws Exception;
    public List<BrandVO> selectBrand(int bizCode) throws Exception;
    public List<CenterVO> selectCenter(int bizCode) throws Exception;
    public int getEndTime(int brandCode) throws Exception;

    // 센터를 찾기위해 존재
    public List<CourierVO> searchCenter(Map<String,Object> map) throws Exception;
    public List<CourierVO> searchTable(Map<String,Object> map) throws Exception;

    // 공통코드
    public List<CommonCodeVO> commonCodeCategory() throws Exception;
    public List<CommonCodeVO> commonCodeEmail() throws Exception;
    public List<CommonCodeVO> commonCodeUsage() throws Exception;
    public List<CommonCodeVO> commonCodePayment() throws Exception;
    public List<CommonCodeVO> commonCodePayMethod() throws Exception;
    public List<CommonCodeVO> commonCodeBank() throws Exception;
    public List<CommonCodeVO> commonCodeGuarantee() throws Exception;
    public List<CommonCodeVO> commonCodeSaleUnit() throws Exception;
    public List<CommonCodeVO> commonCodeCustomerCategory() throws Exception;
    public List<CommonCodeVO> commonCodeDiscount() throws Exception;

    public void insertCustomer(CustomerVO customer) throws Exception;
    public void updateCustomer(CustomerVO customer) throws Exception;
    public void deleteCustomer(CustomerVO customer) throws Exception;

    // sidebar search
    public List<CustomerVO> searchSidebar(Map<String, Object> map) throws Exception;

    // 고객 로그인
    public CustomerVO customerLogin(CustomerVO customer) throws  Exception;
}
