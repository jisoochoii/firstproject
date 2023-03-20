package com.whizlab.first.dao;

import com.whizlab.first.vo.BizVO;
import com.whizlab.first.vo.BrandVO;
import com.whizlab.first.vo.CommonCodeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BizDAOImpl implements BizDAO {

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whizlab.biz";
    private static final String commonNamespace = "com.whizlab.common";


    @Override
    public List<BizVO> bizList() throws Exception {
        return session.selectList(namespace + ".bizList");
    }

    @Override
    public List<BizVO> selectCategory(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".selectCategory", map);
    }

    @Override
    public List<BizVO> searchTable(Map<String, Object> map) throws Exception {
        return session.selectList(namespace + ".searchTable", map);
    }

    @Override
    public BizVO bizViewList(int bizSeq) throws Exception {
        return session.selectOne(namespace + ".bizViewList", bizSeq);
    }

    @Override
    public List<BrandVO> brandList(int brandBizCode) throws Exception {
        return session.selectList(namespace + ".brandList", brandBizCode);
    }

    @Override
    public void saveBrand(BrandVO brand) throws Exception {
        session.insert(namespace + ".saveBrand", brand);
    }

    @Override
    public void deleteBrand(BrandVO brand) throws Exception {
        session.update(namespace + ".deleteBrand", brand);
    }

    @Override
    public int bizMaxNum(int bizCategory) throws Exception {
        return session.selectOne(namespace +".getBizMaxNum", bizCategory);
    }

    @Override
    public List<CommonCodeVO> commonCodeEmail() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeEmail");
    }

    @Override
    public List<CommonCodeVO> commonCodeRegion() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeRegion");
    }

    @Override
    public List<CommonCodeVO> commonCodeBank() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeBank");
    }

    @Override
    public List<CommonCodeVO> commonCodeUsage() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeUsage");
    }

    @Override
    public List<CommonCodeVO> commonCodeCategory() throws Exception {
        return session.selectList(commonNamespace + ".commonCodeCategory");
    }

    @Override
    public void insertBiz(BizVO biz) throws Exception {
        session.insert(namespace + ".insertBiz", biz);
    }

    @Override
    public void updateBiz(BizVO biz) throws Exception {
        session.update(namespace + ".updateBiz", biz);
    }

    @Override
    public void deleteBiz(BizVO biz) throws Exception {
        session.update(namespace + ".deleteBiz", biz);
    }
}
