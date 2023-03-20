package com.whizlab.first.dao;

import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CustomerVO;
import com.whizlab.first.vo.ProductVO;

import java.util.List;
import java.util.Map;

public interface ProductDAO {
    public List<BizVO> bizList() throws Exception;
    public List<CustomerVO> customerList() throws Exception;
    public List<ProductVO> productList() throws Exception;
    public List<ProductVO> searchProduct(Map<String, Object> map) throws Exception;
    public ProductVO productView(int prodSeq) throws Exception;

    public int getMaxProductCodeNum(int prodBizCode) throws Exception;

    public void insertProduct(ProductVO prod) throws Exception;
    public void updateProduct(ProductVO prod) throws Exception;
    public void deleteProduct(ProductVO prod) throws Exception;

    public List<CommonCodeVO> commonCodeCategory() throws Exception;
    public List<CommonCodeVO> commonCodeUsage() throws Exception;
    public List<CommonCodeVO> commonCodeProductArea() throws Exception;
    public List<CommonCodeVO> commonCodeProductClassified() throws Exception;
    public List<CommonCodeVO> commonCodeProductWeb() throws Exception;
    public List<CommonCodeVO> commonCodeProductPicking() throws Exception;
    public List<CommonCodeVO> commonCodeProductTax() throws Exception;
    public List<CommonCodeVO> commonCodeProductStock() throws Exception;
    public List<CommonCodeVO> commonCodeProductOrigin() throws Exception;
    public List<CommonCodeVO> commonCodeProductDeliveryDate() throws Exception;
    public List<CommonCodeVO> commonCodeProductBasicUnit() throws Exception;
    public List<CommonCodeVO> commonCodeProductItem() throws Exception;
    public List<CommonCodeVO> commonCodeProductManage() throws Exception;

    public List<BizVO> optionBizArea(int bizCategory) throws Exception;
    public List<CustomerVO> optionBizCode(int customerBizCode) throws Exception;
    public CustomerVO getDealDates(int customerCode) throws Exception;
}
