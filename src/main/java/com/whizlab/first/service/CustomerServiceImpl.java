package com.whizlab.first.service;

import com.whizlab.first.dao.CustomerDAO;
import com.whizlab.first.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    private CustomerDAO dao;

    @Override
    public List<CustomerVO> customerList() throws Exception {
        return dao.customerList();
    }

    @Override
    public CustomerVO customerView(int customerSeq) throws Exception {
        return dao.customerView(customerSeq);
    }

    @Override
    public List<CenterVO> centerList() throws Exception {
        return dao.centerList();
    }

    @Override
    public List<BizVO> bizList() throws Exception {
        return dao.bizList();
    }

    @Override
    public List<BizVO> selectBuyer() throws Exception {
        return dao.selectBuyer();
    }

    @Override
    public List<BizVO> selectSeller() throws Exception {
        return dao.selectSeller();
    }

    @Override
    public List<BrandVO> selectBrand(int bizCode) throws Exception {
        return dao.selectBrand(bizCode);
    }

    @Override
    public List<BrandVO> brandList() throws Exception {
        return dao.brandList();
    }

    @Override
    public List<CenterVO> selectCenter(int bizCode) throws Exception {
        return dao.selectCenter(bizCode);
    }

    @Override
    public int getCustomerMaxNum(int customerBizCode) throws Exception {
        return dao.getCustomerMaxNum(customerBizCode);
    }

    @Override
    public List<CourierVO> searchCenter(Map<String, Object> map) throws Exception {
        return dao.searchCenter(map);
    }

    @Override
    public List<CourierVO> searchTable(Map<String, Object> map) throws Exception {
        return dao.searchTable(map);
    }

    @Override
    public List<CommonCodeVO> commonCodeCategory() throws Exception {
        return dao.commonCodeCategory();
    }

    @Override
    public List<CommonCodeVO> commonCodeEmail() throws Exception {
        return dao.commonCodeEmail();
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return dao.commonCodeUsage();
    }

    @Override
    public List<CommonCodeVO> commonCodePayment() throws Exception {
        return dao.commonCodePayment();
    }

    @Override
    public List<CommonCodeVO> commonCodePayMethod() throws Exception {
        return dao.commonCodePayMethod();
    }

    @Override
    public List<CommonCodeVO> commonCodeBank() throws Exception {
        return dao.commonCodeBank();
    }

    @Override
    public List<CommonCodeVO> commonCodeGuarantee() throws Exception {
        return dao.commonCodeGuarantee();
    }

    @Override
    public List<CommonCodeVO> commonCodeSaleUnit() throws Exception {
        return dao.commonCodeSaleUnit();
    }

    @Override
    public List<CommonCodeVO> commonCodeCustomerCategory() throws Exception {
        return dao.commonCodeCustomerCategory();
    }

    @Override
    public List<CommonCodeVO> commonCodeDiscount() throws Exception {
        return dao.commonCodeDiscount();
    }

    @Override
    public void insertCustomer(CustomerVO customer) throws Exception {
        dao.insertCustomer(customer);
    }

    @Override
    public void updateCustomer(CustomerVO customer) throws Exception {
        dao.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(CustomerVO customer) throws Exception {
        dao.deleteCustomer(customer);
    }

    @Override
    public List<CustomerVO> searchSidebar(Map<String, Object> map) throws Exception {
        return dao.searchSidebar(map);
    }

    @Override
    public int getEndTime(int brandCode) throws Exception {
        return dao.getEndTime(brandCode);
    }


    @Override
    public CustomerVO customerLogin(CustomerVO customer) throws Exception{
        return dao.customerLogin(customer);
    }


}
