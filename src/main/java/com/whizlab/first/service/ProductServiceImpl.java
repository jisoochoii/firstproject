package com.whizlab.first.service;

import com.whizlab.first.dao.ProductDAO;
import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CustomerVO;
import com.whizlab.first.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductDAO dao;

    @Override
    public List<BizVO> bizList() throws Exception {
        return dao.bizList();
    }

    @Override
    public List<CustomerVO> customerList() throws Exception {
        return dao.customerList();
    }

    @Override
    public List<ProductVO> productList() throws Exception {
        return dao.productList();
    }

    @Override
    public List<ProductVO> searchProduct(Map<String, Object> map) throws Exception {
        return dao.searchProduct(map);
    }

    @Override
    public ProductVO productView(int prodSeq) throws Exception {
        return dao.productView(prodSeq);
    }

    @Override
    public int getMaxProductCodeNum(int prodBizCode) throws Exception {
        return dao.getMaxProductCodeNum(prodBizCode);
    }

    @Override
    public void insertProduct(ProductVO prod) throws Exception {
        dao.insertProduct(prod);
    }

    @Override
    public void updateProduct(ProductVO prod) throws Exception {
        dao.updateProduct(prod);
    }

    @Override
    public void deleteProduct(ProductVO prod) throws Exception {
        dao.deleteProduct(prod);
    }

    @Override
    public List<CommonCodeVO> commonCodeCategory() throws Exception {
        return dao.commonCodeCategory();
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return dao.commonCodeUsage();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductArea() throws Exception {
        return dao.commonCodeProductArea();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductClassified() throws Exception {
        return dao.commonCodeProductClassified();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductWeb() throws Exception {
        return dao.commonCodeProductWeb();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductPicking() throws Exception {
        return dao.commonCodeProductPicking();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductTax() throws Exception {
        return dao.commonCodeProductTax();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductStock() throws Exception {
        return dao.commonCodeProductStock();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductOrigin() throws Exception {
        return dao.commonCodeProductOrigin();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductDeliveryDate() throws Exception {
        return dao.commonCodeProductDeliveryDate();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductBasicUnit() throws Exception {
        return dao.commonCodeProductBasicUnit();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductItem() throws Exception {
        return dao.commonCodeProductItem();
    }

    @Override
    public List<CommonCodeVO> commonCodeProductManage() throws Exception {
        return dao.commonCodeProductManage();
    }

    @Override
    public List<BizVO> optionBizArea(int bizCategory) throws Exception {
        return dao.optionBizArea(bizCategory);
    }

    @Override
    public List<CustomerVO> optionBizCode(int customerBizCode) throws Exception {
        return dao.optionBizCode(customerBizCode);
    }

    @Override
    public CustomerVO getDealDates(int customerCode) throws Exception {
        return dao.getDealDates(customerCode);
    }
}
