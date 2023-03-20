package com.whizlab.first.dao;

import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.CommonCodeVO;
import com.whizlab.first.vo.CustomerVO;
import com.whizlab.first.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductDAOImpl implements ProductDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.product";
    private static final String commonNamespace = "com.whizlab.common";

    @Override
    public List<BizVO> bizList() throws Exception {
        return session.selectList(namespace + ".bizList");
    }

    @Override
    public List<CustomerVO> customerList() throws Exception {
        return session.selectList(namespace + ".customerList");
    }

    @Override
    public List<ProductVO> productList() throws Exception {
        return session.selectList(namespace + ".productList");
    }

    @Override
    public List<ProductVO> searchProduct(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchProduct", map);
    }

    @Override
    public ProductVO productView(int prodSeq) throws Exception {
        return session.selectOne(namespace + ".productView", prodSeq);
    }

    @Override
    public int getMaxProductCodeNum(int prodBizCode) throws Exception {
        return session.selectOne(namespace + ".getMaxProductCodeNum",prodBizCode);
    }

    @Override
    public void insertProduct(ProductVO prod) throws Exception {
        session.insert(namespace + ".insertProduct", prod);
    }

    @Override
    public void updateProduct(ProductVO prod) throws Exception {
        session.update(namespace + ".updateProduct", prod);
    }

    @Override
    public void deleteProduct(ProductVO prod) throws Exception {
        session.update(namespace + ".deleteProduct", prod);
    }

    @Override
    public List<CommonCodeVO> commonCodeCategory() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeCategory");
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeUsage");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductArea() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductArea");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductClassified() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductClassified");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductWeb() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductWeb");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductPicking() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductPicking");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductTax() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductTax");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductStock() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductStock");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductOrigin() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductOrigin");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductDeliveryDate() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductDeliveryDate");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductBasicUnit() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductBasicUnit");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductItem() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductItem");
    }

    @Override
    public List<CommonCodeVO> commonCodeProductManage() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeProductManage");
    }

    @Override
    public List<BizVO> optionBizArea(int bizCategory) throws Exception {
        return session.selectList(namespace + ".optionBizArea", bizCategory);
    }

    @Override
    public List<CustomerVO> optionBizCode(int customerBizCode) throws Exception {
        return session.selectList(namespace + ".optionBizCode", customerBizCode);
    }

    @Override
    public CustomerVO getDealDates(int customerCode) throws Exception {
        return session.selectOne(namespace + ".getDealDates", customerCode);
    }
}
