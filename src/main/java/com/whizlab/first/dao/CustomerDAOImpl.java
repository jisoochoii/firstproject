package com.whizlab.first.dao;

import com.whizlab.first.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CustomerDAOImpl implements CustomerDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.customer";
    private static final String commonNamespace = "com.whizlab.common";

    @Override
    public List<CustomerVO> customerList() throws Exception {
        return session.selectList(namespace + ".customerList");
    }

    @Override
    public CustomerVO customerView(int customerSeq) throws Exception {
        return session.selectOne(namespace + ".customerView", customerSeq);
    }

    @Override
    public List<CenterVO> centerList() throws Exception {
        return session.selectList(namespace + ".centerList");
    }

    @Override
    public List<BizVO> bizList() throws Exception {
        return session.selectList(namespace + ".bizList");
    }

    @Override
    public List<BrandVO> brandList() throws Exception {
        return session.selectList(namespace + ".brandList");
    }

    @Override
    public int getCustomerMaxNum(int customerBizCode) throws Exception {
        return session.selectOne(namespace + ".getCustomerMaxNum", customerBizCode);
    }

    @Override
    public List<BizVO> selectBuyer() throws Exception {
        return session.selectList(namespace + ".selectBuyer");
    }

    @Override
    public List<BizVO> selectSeller() throws Exception {
        return session.selectList(namespace + ".selectSeller");
    }

    @Override
    public List<BrandVO> selectBrand(int bizCode) throws Exception {
        return session.selectList(namespace + ".selectBrand", bizCode);
    }

    @Override
    public List<CenterVO> selectCenter(int bizCode) throws Exception {
        return session.selectList(namespace + ".selectCenter", bizCode);
    }

    @Override
    public List<CourierVO> searchCenter(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchCenter",map);
    }

    @Override
    public List<CourierVO> searchTable(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchTable",map);
    }

    @Override
    public List<CommonCodeVO> commonCodeCategory() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeCategory");
    }

    @Override
    public List<CommonCodeVO> commonCodeEmail() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeEmail");
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeUsage");
    }

    @Override
    public List<CommonCodeVO> commonCodePayment() throws Exception {
        return session.selectList(commonNamespace + ".commonCodePayment");
    }

    @Override
    public List<CommonCodeVO> commonCodePayMethod() throws Exception {
        return session.selectList(commonNamespace + ".commonCodePayMethod");
    }

    @Override
    public List<CommonCodeVO> commonCodeBank() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeBank");
    }

    @Override
    public List<CommonCodeVO> commonCodeGuarantee() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeGuarantee");
    }

    @Override
    public List<CommonCodeVO> commonCodeSaleUnit() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeSaleUnit");
    }

    @Override
    public List<CommonCodeVO> commonCodeCustomerCategory() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeCustomerCategory");
    }

    @Override
    public List<CommonCodeVO> commonCodeDiscount() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeDiscount");
    }

    @Override
    public void insertCustomer(CustomerVO customer) throws Exception {
        session.insert(namespace + ".insertCustomer", customer);
    }

    @Override
    public void updateCustomer(CustomerVO customer) throws Exception {
        session.update(namespace + ".updateCustomer", customer);
    }

    @Override
    public void deleteCustomer(CustomerVO customer) throws Exception {
        session.update(namespace + ".deleteCustomer", customer);
    }

    @Override
    public List<CustomerVO> searchSidebar(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchSidebar", map);
    }

    @Override
    public int getEndTime(int brandCode) throws Exception {
        return session.selectOne(namespace + ".getEndTime", brandCode);
    }

    @Override
    public CustomerVO customerLogin(CustomerVO customer) throws Exception{
        return session.selectOne(namespace + ".customerLogin", customer);

    }
}
